using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Mantenedor
{
    public partial class Eliminar_Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void gvregistros_SelectedIndexChanged(object sender, EventArgs e)
        {

        Session["eliregistro"] = int.Parse(gvregistros.SelectedValue.ToString());
        string script = @"window.location.href = '#modalHtml';";
        ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);

        }

        protected void btngrabarmod_Click(object sender, EventArgs e)
        {

            string validar = Session["Modificar"].ToString();//validar si posee permisos
            if (validar == "SI")
            {

                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE SolicitudPcc  SET Modificar = 'SI'    WHERE id_Solicitud = '" + Session["eliregistro"] + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                gvregistros.DataBind();
                lblmensaje_ok.Visible = true;
                lblmensaje_nook.Visible = false;


                Conn.Close();
            }
            else
            {
                lblmensaje_ok.Visible = false;
                lblmensaje_nook.Visible = true;
            }




        }

        protected void btneliminarmod_Click(object sender, EventArgs e)
        {

            string validar = Session["Eliminar"].ToString();//validar si posee permisos
            if (validar == "SI")
            {

                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "UPDATE SolicitudPcc  SET Empresa = '',Fecha_Ingreso = '',tcambio = '',Estado = '2',empcheque = '',echequea = '',eboletaa = '',comexcontact = '',retiracheque = '',autorizasinpago ='',FAprobFinanz = '',FAprobAuditor = '',NFolio = '',FFinalizaFin = '',NCheque = '',NBoleta = '' WHERE id_Solicitud = '" + Session["eliregistro"] + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                gvregistros.DataBind();
                lblmensaje_ok.Visible = true;
                lblmensaje_nook.Visible = false;
                Conn.Close();
            }
            else
            {
                lblmensaje_ok.Visible = false;
                lblmensaje_nook.Visible = true;
            }




        }

    }
}