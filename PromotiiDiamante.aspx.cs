using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectBDI
{
    public partial class PromotiiDiamante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RadioButtonListFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGridView();
        }

        private void BindGridView()
        {
            string filterValue = RadioButtonListFilter.SelectedValue;

            // Setează parametrul de filtrare în funcție de valoarea selectată
            SDS_promotii.SelectParameters["filter"].DefaultValue = filterValue;

            // Reîncarcă datele în GridView
            GridViewPromotions.DataBind();
        }

     

    }
}