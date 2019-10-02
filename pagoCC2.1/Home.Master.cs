using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            //aqui se cargan la cantidad de los pendientes 
            Mis_Solicitudes();
            pendiente_Auditoria();
            pendiente_Finanzas();


            //aqui se restringe los permisos de los usuarios 
            string VarRegistrar = Session["Registrar"].ToString();
            string VarMantenedor = Session["Mantenedor"].ToString();
            string VarFinanzas = Session["Finanzas"].ToString();
            string VarAuditoria = Session["Auditoria"].ToString();


            //Validadores de perfiles


            lblnombre.Text = Session["Nombre"].ToString();

            if (VarRegistrar == "SI")
            {
                Registrar.Visible = true;
            }
            else
            {
                Registrar.Visible = false;
            }//validar si puede registrar
            if (VarMantenedor == "SI")
            {
                Mantenedor.Visible = true;
            }
            else
            {
                Mantenedor.Visible = false;
            }// validar si puede mantener

            if (VarFinanzas == "SI")
            {
                Finanzas.Visible = true;
            }
            else
            {
                Finanzas.Visible = false;
            }// validar si puede entrarqa finanzas

            if (VarAuditoria == "SI")
            {
                Auditoria.Visible = true;
            }
            else
            {
                Auditoria.Visible = false;
            }// validar si puede entrarqa Auditoria


        }


        protected void Mis_Solicitudes(){
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count (id_Solicitud) as contador FROM SolicitudPcc where  Estado != '2' and [Usuario] = '" + Session["Usuario"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
            lblMis_Solicitudes.Text = dr["contador"].ToString();
            }

            Conn.Close();
        }


        protected void pendiente_Auditoria()
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count (id_Solicitud) as contador FROM SolicitudPcc where  Estado = 'Pendiente Auditor' ";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
              lblsolauditor.Text = dr["contador"].ToString();
            }

            Conn.Close();
        }


        protected void pendiente_Finanzas()
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "select DISTINCT (SELECT count (id_Solicitud) FROM SolicitudPcc where  Estado = 'Solicitado') as solicitado , (SELECT count (id_Solicitud) FROM SolicitudPcc where  Estado = 'Pendiente Finanzas') as pendiente from SolicitudPcc";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                lblsolfinanzas.Text = dr["solicitado"].ToString();
                lblPendinteCheq.Text = dr["pendiente"].ToString();
            }


            Conn.Close();
        }

        protected void cerrarsesion_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
        }



    }


    }