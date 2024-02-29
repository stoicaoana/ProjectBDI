using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBDI
{
    public partial class DataBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate the DropDownList only when the page is loaded for the first time
                PopulateDropDownList();

                // Set the default selected item to "Choose"
                DropDownList1.Items.Insert(0, new ListItem("Alegeti", "0"));
                DropDownList1.SelectedIndex = 0;

                // Display a default message in TextBox1
                TextBox1.Text = "Alegeti un diamant din lista pentru a afisa informatiile.";

                // Set clientIdFromSDS after DropDownList is populated
                SDS_ClientDetails.SelectParameters["clientId"].DefaultValue = "0"; // Set a default value
                string clientIdFromSDS = SDS_ClientDetails.SelectParameters["clientId"].DefaultValue;
                System.Diagnostics.Debug.WriteLine("ClientId in Page_Load: " + clientIdFromSDS);
            }
        }




        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Check if a row is selected in GridView1
            if (GridView1.SelectedRow != null)
            {
                // Show the DetailsViewClient
                DetailsViewClient.Visible = true;

                // Set the selected value for the DetailsViewClient
                string clientId = GridView1.SelectedDataKey.Values["clientId"].ToString();
                SDS_ClientDetails.SelectParameters["clientId"].DefaultValue = clientId;

                // Log for debugging
                System.Diagnostics.Debug.WriteLine("Selected ClientId: " + clientId);

                // Force DataBinding for SDS_ClientDetails and DetailsViewClient
                SDS_ClientDetails.DataBind();
                DetailsViewClient.DataBind();
                
            }
            else
            {
                // Hide the DetailsViewClient when no row is selected
                DetailsViewClient.Visible = false;
            }
        }


  




        private string GetDiamondInfo(int diamondId)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\I746372\\source\\repos\\DiamantProj\\ProjectBDI\\App_Data\\diamant.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT dbo.GetDiamondInfo(@diamantId)", connection))
                {
                    command.Parameters.AddWithValue("@diamantId", diamondId);

                    object result = command.ExecuteScalar();
                    return result != null ? result.ToString() : "Diamantul nu a fost gasit.";
                }
            }
        }



        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
           
            int selectedDiamondId;
            if (int.TryParse(DropDownList1.SelectedValue, out selectedDiamondId))
            {
                string diamondInfo = GetDiamondInfo(selectedDiamondId);
                TextBox1.Text = diamondInfo;
            }
        }

        protected void AdRotator1_AdCreated(object sender, AdCreatedEventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void PopulateDropDownList()
        {
            DropDownList1.DataSourceID = "SDS_Diamante";
            DropDownList1.DataBind();
        }

       

       

        // Adaugă această secțiune în cadrul clasei DataBinding
        protected void btnInsertRecenzie_Click(object sender, EventArgs e)
        {
            int selectedDiamondId;
            if (int.TryParse(DropDownListDiamantId.SelectedValue, out selectedDiamondId))
            {
                float nota;
                if (float.TryParse(txtbNota.Text, out nota))
                {
                    int clientId;
                    if (int.TryParse(DropDownList3.SelectedValue, out clientId))
                    {
                        string comentariu = txtBComm.Text;

                        // Inserează recenzia în baza de date
                        InsertRecenzie(selectedDiamondId, nota, clientId, comentariu);

                        // Setează DropDownList3.SelectedValue
                        DropDownList3.SelectedValue = clientId.ToString();

                        // Reîncarcă GridView pentru a reflecta schimbările
                        GridView1.DataBind();
                        // Force DataBinding for SDS_ClientDetails
                        SDS_ClientDetails.DataBind();

                        // Curăță valorile introduse
                        DropDownListDiamantId.SelectedIndex = 0;
                        txtbNota.Text = string.Empty;
                        txtBComm.Text = string.Empty;
                        DropDownList3.SelectedIndex = 0;
                    }
                    else
                    {
                        // Mesaj de eroare pentru clientId
                        Response.Write("<script>alert('Selectați un client valid.');</script>");
                    }
                }
                else
                {
                    // Mesaj de eroare pentru nota
                    Response.Write("<script>alert('Introduceți o notă validă.');</script>");
                }
            }
            else
            {
                // Mesaj de eroare pentru diamantId
                Response.Write("<script>alert('Selectați un diamant valid.');</script>");
            }
        }

        private void InsertRecenzie(int diamantId, float nota, int clientId, string comentariu)
        {
            string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\I746372\\source\\repos\\DiamantProj\\ProjectBDI\\App_Data\\diamant.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("INSERT INTO [Recenzie] ([diamantId], [nota], [clientId], [comentariu]) VALUES (@diamantId, @nota, @clientId, @comentariu)", connection))
                {
                    command.Parameters.AddWithValue("@diamantId", diamantId);
                    command.Parameters.AddWithValue("@nota", nota);
                    command.Parameters.AddWithValue("@clientId", clientId);
                    command.Parameters.AddWithValue("@comentariu", comentariu);

                    command.ExecuteNonQuery();
                }
            }
        }




    }
}