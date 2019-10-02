using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Auditoria
{
    public partial class Solicitudes_Auditoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pendientesdeauditoria.SelectCommand = "SELECT SolicitudPcc.id_Solicitud,SolicitudPcc.Empresa,FORMAT(SolicitudPcc.FRecepAudi,'dd-MM-yyyy') as FRecepAudi,SolicitudPcc.RecibidoAuditor,SolicitudPcc.Usuario,FORMAT(SolicitudPcc.Fecha_Ingreso,'dd-MM-yyyy') as Fecha_Ingreso,SolicitudPcc.tcambio,SolicitudPcc.Estado,SolicitudPcc.ncontador,SolicitudPcc.empcheque,SolicitudPcc.echequea,SolicitudPcc.cargo,SolicitudPcc.eboletaa,SolicitudPcc.comexcontact,SolicitudPcc.retiracheque,stuff((select ', '+ DetallePago.N_Factura from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') facturas,stuff((select ', '+ DetallePago.N_Operacion from DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador for XML path('')),1,1,'') operaciones,(SELECT sum (DetallePago.MontoCC) FROM DetallePago where DetallePago.id_SolPCC = SolicitudPcc.ncontador ) as monto  FROM SolicitudPcc where SolicitudPcc.Estado = 'Pendiente Auditor'  order by id_Solicitud desc ";
            gvccpendauditor.DataBind();

        }

        protected void gvccpendauditor_SelectedIndexChanged(object sender, EventArgs e)
        {
           Session["nsolicitud"] = int.Parse(gvccpendauditor.SelectedValue.ToString());
           Response.Redirect("~/Auditoria/Verdetalle_Auditoria.aspx");
 
        }



    }
}