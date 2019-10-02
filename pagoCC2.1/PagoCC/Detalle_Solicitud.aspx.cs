using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace pagoCC2._1.PagoCC
{
    public partial class Detalle_Solicitud : System.Web.UI.Page
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

            cargardatos();

        }





        public void cargardatos()
        {
            string var = ddlemprpago.SelectedItem.ToString();

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT id_Codigo,RUT,Nombre_Emp,Codigo_Emp,EChequeA,Cargo,Email,RetiraCheque,Comex,eboletaa FROM CodEmpr with(nolock) where  Nombre_Emp = '" + var + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            txtechequea.Text = dr["EChequeA"].ToString();
            txtcargo.Text = dr["Cargo"].ToString();
            txteboletaa.Text = dr["eboletaa"].ToString();
            txtxcomex.Text = dr["Comex"].ToString();
            txtretiracheque.Text = dr["RetiraCheque"].ToString();
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
            cmd.CommandText = "SELECT Modificar  FROM SolicitudPcc with(nolock)  where ncontador = '" + lblid.Text + "'";
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
                btnGrabar.Visible = true;
                btnmodificar.Visible = false;
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

            btnmodificar.Visible = true;
            btnGrabar.Visible = false;
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

        }




    }
}