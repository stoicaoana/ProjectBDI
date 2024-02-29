using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBDI
{
    public partial class ListaFurnizori : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Este o încărcare inițială, nu un postback
                BindGridView();
            }
        }
        protected void GrdViewListaFurnizori_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GrdViewListaFurnizori.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GrdViewListaFurnizori_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int furnizorId = Convert.ToInt32(GrdViewListaFurnizori.DataKeys[e.RowIndex].Values["furnizorId"]);
            string numeFurnizor = e.NewValues["numeFurnizor"].ToString();
            string taraOrigine = e.NewValues["taraOrigine"].ToString();

            // Implementați logica de actualizare în baza de date aici
            // Exemplu: UpdateProducer stored procedure
            SDS_Furnizori.UpdateParameters["furnizorId"].DefaultValue = furnizorId.ToString();
            SDS_Furnizori.UpdateParameters["numeFurnizor"].DefaultValue = numeFurnizor;
            SDS_Furnizori.UpdateParameters["taraOrigine"].DefaultValue = taraOrigine;
            SDS_Furnizori.Update();

            GrdViewListaFurnizori.EditIndex = -1;
            BindGridView();
        }

        protected void GrdViewListaFurnizori_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int furnizorId = Convert.ToInt32(GrdViewListaFurnizori.DataKeys[e.RowIndex].Values["furnizorId"]);

            // Implementați logica de ștergere în baza de date aici
            // Exemplu: DeleteProducer stored procedure
            SDS_Furnizori.DeleteParameters["furnizorId"].DefaultValue = furnizorId.ToString();
            SDS_Furnizori.Delete();

            BindGridView();
        }

        protected void GrdViewListaFurnizori_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GrdViewListaFurnizori.EditIndex = -1;
            BindGridView();
        }

     
        protected void GrdViewListaFurnizori_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                // Verificați dacă există un rând selectat în GridView
                if (GrdViewListaFurnizori.SelectedIndex >= 0)
                {
                    // Obțineți furnizorul selectat
                    int furnizorId = Convert.ToInt32(GrdViewListaFurnizori.SelectedDataKey.Value);

                    // Verificați dacă SDS_DiamanteFurnizorList este inițializat
                    if (SDS_DiamanteFurnizorList != null)
                    {
                        // Setați parametrul de control pentru DataSource-ul SDS_DiamanteFurnizorList
                        SDS_DiamanteFurnizorList.SelectParameters["furnizorId"].DefaultValue = furnizorId.ToString();

                        // Reîmprospătați GridView-ul GrdViewDiamanteFurnizorList
                        GrdViewDiamanteFurnizorList.DataBind();
                    }
                    else
                    {
                        // Tratați situația în care SDS_DiamanteFurnizorList nu este inițializat
                        // puteți adăuga aici logica necesară sau aruncarea unei excepții
                        throw new Exception("SDS_DiamanteFurnizorList nu este inițializat.");
                    }
                }
                else
                {
                    // Tratați situația în care nu există un rând selectat
                    throw new Exception("Nu există un rând selectat în GridView.");
                }
            }
            catch (Exception ex)
            {
                // Afișați sau înregistrați excepția pentru diagnosticare
                Response.Write("Exception: " + ex.ToString());
            }
        }

        private void BindGridView()
        {
            // Apelați această metodă pentru a reîmprospăta GridView
            GrdViewListaFurnizori.DataBind();
        }
        protected void btnAdaugaFurnizor_Click(object sender, EventArgs e)
        {
            // Obțineți valorile introduse de utilizator pentru noul furnizor
            string numeFurnizor = txtNumeFurnizor.Text; // înlocuiți txtNumeFurnizor cu ID-ul real al controlului de intrare
            string taraOrigine = txtTaraOrigine.Text; // înlocuiți txtTaraOrigine cu ID-ul real al controlului de intrare

            // Implementați logica de inserare în baza de date aici
            // Exemplu: InsertProducer stored procedure
            SDS_Furnizori.InsertParameters["numeFurnizor"].DefaultValue = numeFurnizor;
            SDS_Furnizori.InsertParameters["taraOrigine"].DefaultValue = taraOrigine;
            SDS_Furnizori.Insert();

            // Reîmprospătați GridView-ul pentru a afișa noul furnizor adăugat
            BindGridView();
            
            txtNumeFurnizor.Text = string.Empty;
            txtTaraOrigine.Text = string.Empty;
        }

    }
}