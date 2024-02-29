using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace ProjectBDI
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DataBinding.aspx");
        }

        protected void btnDropCreate_Click(object sender, EventArgs e)
        {
            string dropProc = "DROP PROCEDURE IF EXISTS calculMedie";
            SqlConnection myCon = new SqlConnection(
                @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\I746372\source\repos\DiamantProj\ProjectBDI\App_Data\diamant.mdf;Integrated Security=True;Connect Timeout=30");
            SqlCommand myCmd = new SqlCommand(dropProc, myCon);
            try
            {
                myCon.Open();
                myCmd.ExecuteNonQuery();
                tbMes.Text += "\n\r Drop ok.";
            }
            catch (Exception Ex)
            {
                tbMes.Text += "\n\r Drop failed." + Ex.Message;
            }

            string createProc = "CREATE PROCEDURE calculMedie " +
                                "@minProfit_Platforma FLOAT, " +
                                "@maxProfit_Platforma FLOAT, " +
                                "@media FLOAT OUTPUT " +
                                "AS " +
                                "BEGIN " +
                                "    SELECT fv.*, d.denumire " +
                                "    FROM FacturaVanzare fv " +
                                "    INNER JOIN Diamant d ON fv.diamantId = d.diamantId " +
                                "    WHERE fv.pretVanzare >= @minProfit_Platforma AND fv.pretVanzare <= @maxProfit_Platforma; " +
                                "    SELECT @media = AVG(fv.pretVanzare) " +
                                "    FROM FacturaVanzare fv " +
                                "    WHERE fv.pretVanzare >= @minProfit_Platforma AND fv.pretVanzare <= @maxProfit_Platforma; " +
                                "END;";

            myCmd = new SqlCommand(createProc, myCon);
            try
            {
                myCmd.ExecuteNonQuery();
                tbMes.Text += "\n\r Create ok.";
            }
            catch (Exception Ex)
            {
                tbMes.Text += "\n\r Create failed." + Ex.Message;
            }
        }

        protected void btnCall_Click(object sender, EventArgs e)
        {
            tbMes.Text = "";
            tbMes.Text += "\n\r" + "DIAMANT " + " - " + "Pret Vanzare";
            SqlConnection myCon = new SqlConnection(
                @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\I746372\source\repos\DiamantProj\ProjectBDI\App_Data\diamant.mdf;Integrated Security=True;Connect Timeout=30");
            SqlCommand myCmd = new SqlCommand("calculMedie", myCon);
            myCmd.CommandType = System.Data.CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@minProfit_Platforma", System.Data.SqlDbType.Float);
            p1.Value = double.Parse(tbMin.Text);
            myCmd.Parameters.Add(p1);
            SqlParameter p2 = new SqlParameter("@maxProfit_Platforma", System.Data.SqlDbType.Float);
            p2.Value = double.Parse(tbMax.Text);
            myCmd.Parameters.Add(p2);
            SqlParameter p3 = new SqlParameter("@media", System.Data.SqlDbType.Float);
            p3.Direction = System.Data.ParameterDirection.Output;
            myCmd.Parameters.Add(p3);

            SqlDataReader dr = null;
            try
            {
                myCon.Open();
                dr = myCmd.ExecuteReader();
               
                while (dr.Read())
                {
                    tbMes.Text += "\n\r" + dr["denumire"] + " - " + dr["pretVanzare"]+" LEI";
                }
            }
            catch (Exception ex)
            {
                tbMes.Text += "\n\r Read failed: " + ex.Message;
            }
            finally
            {
                myCon.Close();
                dr?.Close();
                tbMedie.Text = p3.Value.ToString();
            }
        }
    }
}
