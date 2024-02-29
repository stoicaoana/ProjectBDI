using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System;
using OxyPlot.Series;
using OxyPlot;
using OxyPlot.Series;
using System.Web.UI.WebControls;
using System.IO;

namespace ProjectBDI
{
    public partial class VanzariDiamante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindChartData();
                BindGridView();
            }
        }

        private void BindChartData()
        {
            DataTable dataTable = GetDataTableForPieChart();

            var plotModel = new PlotModel { Title = "Tipuri de Plati" };
            var series = new PieSeries();

            foreach (DataRow row in dataTable.Rows)
            {
                string statusPlata = row["statusPlata"].ToString();
                int count = Convert.ToInt32(row["Count"]);
                series.Slices.Add(new PieSlice(statusPlata, count));
            }

            plotModel.Series.Add(series);

            // Convert the plot model to an image
            var imageBytes = PlotToImageBytes(plotModel);

            // Create an Image control and set its properties
            var imageControl = new System.Web.UI.WebControls.Image();
            imageControl.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(imageBytes);
            imageControl.AlternateText = "Pie Chart";

            // Add the Image control to a PlaceHolder control
            PlaceHolder1.Controls.Add(imageControl);
        }

        private DataTable GetDataTableForPieChart()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT
                        statusPlata,
                        COUNT(*) AS Count
                    FROM
                        FacturaVanzare
                    GROUP BY
                        statusPlata
                ";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader);
                        return dataTable;
                    }
                }
            }
        }

          private byte[] PlotToImageBytes(PlotModel plotModel)
    {
            using (var stream = new MemoryStream())
            {
                var pngExporter = new OxyPlot.WindowsForms.PngExporter { Width = 400, Height = 300 };
                pngExporter.Export(plotModel, stream);

                return stream.ToArray();
            }
    }




        private void BindGridView()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT ROW_NUMBER() OVER(ORDER BY d.denumire) AS Nr, d.denumire as DenumireDiamant, f.pretVanzare as PretVanzare, CONVERT(varchar, f.dataVanzare, 101) as DataVanzare, c.numePrenume as NumeClient, f.statusPlata as statusPlata FROM FacturaVanzare f LEFT JOIN Diamant d ON f.diamantId = d.diamantId LEFT JOIN Client c ON f.clientId = c.clientId";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        DataTable dataTable = new DataTable();
                        dataTable.Load(reader);

                        // Filtrare în funcție de valoarea selectată sau afișare toate dacă nu este selectată nicio opțiune
                        DataView dv = new DataView(dataTable);

                        // Obțineți valoarea selectată din RadioButtonList
                        string statusPlata = RadioButtonList1.SelectedValue;

                        if (!string.IsNullOrEmpty(statusPlata) && statusPlata != "Toate")
                        {
                            dv.RowFilter = $"statusPlata = '{statusPlata}'";
                        }

                        GridViewFacturaVanzareDiamant.DataSource = dv;
                        GridViewFacturaVanzareDiamant.DataBind();
                    }
                }
            }
        }

        
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Obțineți valoarea selectată din RadioButtonList
            string statusPlata = RadioButtonList1.SelectedValue;

            // Verificare în consolă/debug
            Console.WriteLine($"Selected Status Plata: {statusPlata}");

            // Re-bind GridView si chart cu datele filtrate
            BindGridView();
            BindChartData();
        }
    }
}