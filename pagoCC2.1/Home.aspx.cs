using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void gvMensajes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["nsolicitud"] = int.Parse(gvMensajes.SelectedValue.ToString());
            Response.Redirect("~/PagoCC/Detalle_Solicitud.aspx");

        }
    }

}