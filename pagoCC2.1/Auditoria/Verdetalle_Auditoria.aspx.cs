using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Auditoria
{
    public partial class Verdetalle_Auditoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblid.Text = Session["nsolicitud"].ToString();
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT id_Solicitud,Empresa,NBoleta,Usuario,FORMAT(Fecha_Ingreso,'dd-MM-yyyy') as Fecha_Ingreso,FORMAT(FRecepAudi,'dd-MM-yyyy') as FRecepAudi,tcambio,Estado,ncontador,empcheque,echequea,cargo,eboletaa,comexcontact,retiracheque,autorizasinpago FROM SolicitudPcc with(nolock) where ncontador = " + lblid.Text + "";
                dr = cmd.ExecuteReader();
                dr.Read();
                ddlempresa.SelectedValue = dr["Empresa"].ToString();
                txtuser.Text = dr["Usuario"].ToString();
                txttcambio.Text = dr["tcambio"].ToString();
                txtfingreso.Text = dr["Fecha_Ingreso"].ToString();
                ddlemprpago.SelectedValue = dr["empcheque"].ToString();
                txtechequea.Text = dr["echequea"].ToString();
                txtcargo.Text = dr["cargo"].ToString();
                txteboletaa.Text = dr["eboletaa"].ToString();
                txtxcomex.Text = dr["comexcontact"].ToString();
                txtretiracheque.Text = dr["retiracheque"].ToString();
                lblestado.Text = dr["Estado"].ToString();
                txtnboleta.Text = dr["NBoleta"].ToString();
                Cant_Comentarios();
                string estado = dr["autorizasinpago"].ToString();
                if (estado == "1")
                {
                    cbautopant.Checked = true;
                }

                string recibido = dr["FRecepAudi"].ToString();

                if (recibido =="")
                {
                    btnrecibido.Visible = true;
                    lblrecibido.Visible = false;
                    btnaprobar.Visible = false;
                }
                else
                {
                    btnrecibido.Visible = false;
                    lblrecibido.Visible = true;
                    lblrecibido.Text = dr["FRecepAudi"].ToString();
                    btnaprobar.Visible = true;
                }


                Conn.Close();


            }

    

        }


        protected void ddlemprpago_SelectedIndexChanged(object sender, EventArgs e)
        {

            cargar_datos();

        }


        protected void cargar_datos()
        {
            lblid.Text = Session["nsolicitud"].ToString();
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = " SELECT id_Solicitud,FRecepAudi, NBoleta, Empresa, Usuario, Fecha_Ingreso, tcambio, Estado, ncontador, empcheque, echequea, cargo, eboletaa, comexcontact, retiracheque, autorizasinpago FROM SolicitudPcc with(nolock) where ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            ddlempresa.SelectedValue = dr["Empresa"].ToString();
            txtuser.Text = dr["Usuario"].ToString();
            txttcambio.Text = dr["tcambio"].ToString();
            txtfingreso.Text = dr["Fecha_Ingreso"].ToString();
            ddlemprpago.SelectedValue = dr["empcheque"].ToString();
            txtechequea.Text = dr["echequea"].ToString();
            txtcargo.Text = dr["cargo"].ToString();
            txteboletaa.Text = dr["eboletaa"].ToString();
            txtxcomex.Text = dr["comexcontact"].ToString();
            txtretiracheque.Text = dr["retiracheque"].ToString();
            lblestado.Text = dr["Estado"].ToString();
            txtnboleta.Text = dr["NBoleta"].ToString();
          //  lblrecibido.Text = dr["FRecepAudi"].ToString();
            string estado = dr["autorizasinpago"].ToString();
            string fecha = dr["FRecepAudi"].ToString();

            if (estado == "1")
            {
                cbautopant.Checked = true;
            }

            if (fecha == "")
            {
                btnrecibido.Visible = true;
            }


            Conn.Close();
            Cant_Comentarios();
        }

      

        protected void btnaprobar_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "UPDATE SolicitudPcc SET NFolio='" + txtNFolio.Text + "' , Estado = 'Pendiente Finanzas' , FAprobAuditor = '" + Hoy.ToString("yyyy-MM-dd") + "'  WHERE ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            btnaprobar.Visible = false;
     

            cargar_datos();
        }

        protected void btnimprimir_Click(object sender, EventArgs e)
        {
            string str;
            str = "window.open('/PagoCC/Reportes/Imprimir_Solicitud.aspx','Solicitud Pago CC','width=980px,height=980px,sc rollbars=no,resizable=no')";

            Response.Write("<script languaje=javascript>" + str + "</script>");
        }

        protected void btnrecibido_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "UPDATE SolicitudPcc SET  FRecepAudi = '" + Hoy.ToString("dd-MM-yyyy") + "'  WHERE ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            btnrecibido.Visible = false;
            btnaprobar.Visible = true;
            cargar_datos();
            Conn.Close();
        }


        protected void gvoperacion_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnComentario_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "INSERT INTO DetallePcc(NContsolpcc,Usuario,FechaingDet,Detalle)VALUES('" + lblid.Text + "','" + Session["Usuario"] + "','" + Hoy.ToString("yyyy-MM-dd") + "','" + txtComentario.Text + "') ";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            txtComentario.Text = "";
          GvComentarios.DataBind();
            Cant_Comentarios();

        }



        protected void Cant_Comentarios()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count(Detalle) as contador FROM DetallePcc with(nolock) WHERE([NContsolpcc] = '"+ Session["nsolicitud"] + "')";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblcomentarios.Text = dr["contador"].ToString();
            
            Conn.Close();

            
            }

       


    }
}