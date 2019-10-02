using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.PagoCC
{
    public partial class MisSolicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void gvmissolicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {

            Session["nsolicitud"] = int.Parse(gvmissolicitudes.SelectedValue.ToString());
            Response.Redirect("~/PagoCC/Detalle_Solicitud.aspx");
        }

        protected void gvfinalizadas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["nsolicitud"] = int.Parse(gvfinalizadas.SelectedValue.ToString());
            Response.Redirect("~/PagoCC/Detalle_Solicitud.aspx");
        }
    }
}