using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Finanzas
{
    public partial class Solicitudes_Finanzas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void gvsolpendientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["nsolicitud"] = int.Parse(gvsolpendientes.SelectedValue.ToString());
            Response.Redirect("~/Finanzas/VerDetalle_Finanzas.aspx");



        }

        protected void gvsolchequespend_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["nsolicitud"] = int.Parse(gvsolchequespend.SelectedValue.ToString());
            Response.Redirect("~/Finanzas/Finalizar_Finanzas.aspx");

        }
    }
}