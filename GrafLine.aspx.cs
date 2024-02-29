using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.UI;
using ZedGraph;
using ZedGraph.Web;

namespace ProjectBDI
{
    public partial class GrafLine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verificați dacă pagina este încărcată pentru prima dată
            if (!IsPostBack)
            {
                // Inițializați graficul
                InitializeGraph();
            }
        }

        private void InitializeGraph()
        {
            if (ZedGraphWebLine != null)
            {
                // Adăugați evenimentul RenderGraph la controlul ZedGraphWebLine
                ZedGraphWebLine.RenderGraph += ZedGraphWebLine_RenderGraph;
            }
            else
            {
                string errorMessage = "Eroare de binduire date.";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('{errorMessage}');", true);
            }
        }


        private DataTable GetSalesDataFromStoredProcedure()
        {
            // Conexiunea ta la baza de date
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\I746372\source\repos\DiamantProj\ProjectBDI\App_Data\diamant.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("GenerareGraficVanzari", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                    {
                        DataTable salesData = new DataTable();
                        adapter.Fill(salesData);
                        return salesData;
                    }
                }
            }
        }

        protected void ZedGraphWebLine_RenderGraph(ZedGraph.Web.ZedGraphWeb webObject, System.Drawing.Graphics g, ZedGraph.MasterPane pane)
        {
            DataTable data = GetSalesDataFromStoredProcedure();

            if (data != null && data.Rows.Count > 0)
            {
                // Inițializare grafic
                GraphPane myPane = pane[0];
                List<string> list = new List<string>();
                PointPairList ppList = new PointPairList();
                Color[] colors = {
            Color.Red, Color.Yellow, Color.Green, Color.Blue,
            Color.Purple, Color.Pink, Color.Plum, Color.Silver, Color.Salmon
        };

                for (int i = 0; i < data.Rows.Count; i++)
                {
                    DataRow row = data.Rows[i];
                    list.Add(row["AnVanzare"].ToString());
                    ppList.Add(i, Convert.ToDouble(row["ValoareTotalaVanzari"]));
                }

                LineItem curve = myPane.AddCurve("Spline", ppList, Color.Purple, SymbolType.Diamond);
                curve.Line.IsSmooth = true;
                curve.Line.SmoothTension = 0.5F;
                curve.Line.Width = 2;

                curve.Symbol.Fill = new Fill(Color.White);
                curve.Symbol.Size = 8;

                // Adăugare datelor de pe axa X
                myPane.XAxis.Scale.TextLabels = list.ToArray();
                myPane.XAxis.Scale.FontSpec.Angle = 50;
                myPane.XAxis.Type = AxisType.Text;
            }
            else
            {
                // Dacă nu există date, afișați un mesaj de alertă utilizând JavaScript
                string script = "alert('Nu există date disponibile pentru a afișa graficul!');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }

    }
}
