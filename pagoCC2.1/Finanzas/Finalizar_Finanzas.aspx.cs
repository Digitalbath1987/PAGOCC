using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Finanzas
{
    public partial class Finalizar_Finanzas : System.Web.UI.Page
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
                cmd.CommandText = "SELECT id_Solicitud,Empresa,NBoleta,Usuario,FORMAT(Fecha_Ingreso,'dd-MM-yyyy') as Fecha_Ingreso,tcambio,Estado,ncontador,empcheque,echequea,cargo,eboletaa,comexcontact,retiracheque,autorizasinpago FROM SolicitudPcc with(nolock) where ncontador = " + lblid.Text + "";
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
            cmd.CommandText = " SELECT id_Solicitud, FRecepFina,Empresa, Usuario, Fecha_Ingreso, tcambio, Estado, ncontador, empcheque, echequea, cargo, eboletaa, comexcontact, retiracheque, autorizasinpago FROM SolicitudPcc with(nolock) where ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            ddlempresa.SelectedValue = dr["Empresa"].ToString();
            txtuser.Text = dr["Usuario"].ToString();
            txttcambio.Text = dr["tcambio"].ToString();
            txtfingreso.Text = dr["Fecha_Ingreso"].ToString();
            ddlemprpago.SelectedValue = dr["empcheque"].ToString();
            txtechequea.Text = dr["echequea"].ToString();
            lblrecibido.Text = dr["FRecepFina"].ToString();
            txtcargo.Text = dr["cargo"].ToString();
            txteboletaa.Text = dr["eboletaa"].ToString();
            txtxcomex.Text = dr["comexcontact"].ToString();
            txtretiracheque.Text = dr["retiracheque"].ToString();
            lblestado.Text = dr["Estado"].ToString();
            string fecha = dr["FRecepFina"].ToString();
            string estado = dr["autorizasinpago"].ToString();
            if (estado == "1")
            {
                cbautopant.Checked = true;
            }

            if (fecha == "")
            {
                btnrecibido.Visible = true;
            }

            Conn.Close();
        }

        protected void btnimprimir_Click(object sender, EventArgs e)
        {
            Imprimir();

        }

        protected void Imprimir()
        {
            string str;
            str = "window.open('/PagoCC/Reportes/Imprimir_Solicitud.aspx','Solicitud Pago CC','width=980px,height=980px,sc rollbars=no,resizable=no')";
            Response.Write("<script languaje=javascript>" + str + "</script>");
        }

        protected void cbautopant_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void Detallescc_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnmod_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Modificar  FROM SolicitudPcc with(nolock) where ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            string validar = dr["Modificar"].ToString();
            if (validar == "SI")
            {
                txtnboleta.Enabled = true;
                txtechequea.Enabled = true;
                txtcargo.Enabled = true;
                txteboletaa.Enabled = true;
                txtxcomex.Enabled = true;
                txtretiracheque.Enabled = true;
             
                ddlempresa.Enabled = true;

            }
            else
            {
                lblestado.Text = "Numero de Solicitud no posee permiso para modificar, Contacte al Administrador!!!!!!!!!!";
                this.lblestado.ForeColor = System.Drawing.Color.Red;
                lblestado.Visible = true;
            }

            Conn.Close();


        }



        protected void btngrabar_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "UPDATE SolicitudPcc  SET Empresa = '" + ddlempresa.SelectedValue + "',echequea ='  " + txtechequea.Text + "',cargo = ' " + txtcargo.Text + "',eboletaa = '" + txteboletaa.Text + "',comexcontact = ' " + txtxcomex.Text + "',retiracheque = '" + txtretiracheque.Text + "'  ,NBoleta = '" + txtnboleta.Text + "',Modificar = 'NO' where ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblestado.Text = "Datos modificados!!!!!!!!!!";
            this.lblestado.ForeColor = System.Drawing.Color.Green;
            lblestado.Visible = true;
            Conn.Close();

           


            txtnboleta.Enabled = false;
            txtechequea.Enabled = false;
            txtcargo.Enabled = false;
            txteboletaa.Enabled = false;
            txtxcomex.Enabled = false;
            txtretiracheque.Enabled = false;
            ddlempresa.Enabled = false;


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

        protected void btnrecibido_Click(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "UPDATE SolicitudPcc SET  FRecepFina = '" + Hoy.ToString("dd-MM-yyyy") + "'  WHERE ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            btnrecibido.Visible = false;
            cargar_datos();
            Conn.Close();
        }
        protected void btnFinalizar_Click(object sender, EventArgs e)
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            cmd.CommandText = "UPDATE SolicitudPcc SET Estado = 'Finalizado' , NCheque = '" + txtncheque.Text + "' , FFinalizaFin = '" + Hoy.ToString("yyyy-MM-dd") + "'  WHERE ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            btnFinalizar.Visible = false;
            //btnrechazar.Visible = false;
            cargar_datos();
            mail();
        }

        public void mail()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Usuarios.Nombre,Usuarios.Usuario,Usuarios.Correo,Mail.id_Mail,Mail.UserMail,Mail.PassMail,Mail.FirmaMail,Mail.PuertoMail,Mail.ServerMail FROM Usuarios , SolicitudPcc , Mail where SolicitudPcc.Usuario = Usuarios.Usuario and SolicitudPcc.ncontador = " + lblid.Text + " ";
            dr = cmd.ExecuteReader();
            dr.Read();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
            mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + " ", Encoding.UTF8);
            mail.IsBodyHtml = true;
            mail.Subject = "Se Ha Finalizado Solicitud Pago CC  Numero : " + lblid.Text + " ";
            DateTime Hoy = DateTime.Today;
            mail.Body = ("<strong> El Usuario " + Session["Nombre"].ToString() + " Ha Finalizado Una Solicitud de Pago CC con Fecha : " + Hoy.ToString("dd-MM-yyyy") + "<br/>Se Asocio Numero de Cheque  : " + txtncheque.Text + "<br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
            mail.To.Add("" + dr["Correo"].ToString() + "");
            SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
            SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            Conn.Close();

        }
        protected void Cant_Comentarios()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT count(Detalle) as contador FROM DetallePcc with(nolock) WHERE([NContsolpcc] = '" + Session["nsolicitud"] + "')";
            dr = cmd.ExecuteReader();
            dr.Read();
            lblcomentarios.Text = dr["contador"].ToString();

            Conn.Close();


        }


    }
}