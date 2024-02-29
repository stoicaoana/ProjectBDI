using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ProjectBDI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable dataTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load data only on initial page load
                LoadData();
            }
           
            // Update the DropDownListGraph reference here
            if (DropDownListGrafic.SelectedIndex != 0)
            {
                Response.Redirect("Graph.aspx?type=" + DropDownListGrafic.SelectedValue);
            } 
        }

        protected void LoadData()
        {
            if (Cache["Recenzii"] == null)
            {
                // If not, fill the DataTable and store it in Cache
                string connString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection sqlConnection = new SqlConnection(connString))
                {
                    sqlConnection.Open();

                    // Check if the textBoxCategory is empty
                    string categoryFilter = string.IsNullOrEmpty(txtNumeFilter.Text) ? "" : $"AND d.categorie = '{txtNumeFilter.Text}'";

                    String sqlString = $"SELECT d.denumire as numeDiamant, AVG(r.nota) as MediaRecenzii, COUNT(r.nota) as NumarRecenzii " +
                                       $"FROM Diamant d, Recenzie r WHERE d.diamantId = r.diamantId {categoryFilter} GROUP BY d.denumire";

                    using (SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlString, sqlConnection))
                    {
                        sqlDataAdapter.Fill(dataTable);
                        Cache["Recenzii"] = dataTable;
                    }
                }
            }

            // Add JavaScript alert if no category is found
            if (dataTable.Rows.Count == 0)
            {
                string script = "alert('No category found for the selected diamond.');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Triggered when the user clicks a submit button or performs an action
            LoadData();
           
        }
    }
}
