using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.PagoCC
{
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           

           if (!Page.IsPostBack){

                //aqui se busca la tasa de cambio y se asigna al texbox 
                //---------------------------------------------------------------------

                try { 
                string apiUrl = "http://www.mindicador.cl/api";
                string jsonString = "{}";
                WebClient http = new WebClient();
                JavaScriptSerializer jss = new JavaScriptSerializer();
                http.Headers.Add(HttpRequestHeader.Accept, "application/json");
                jsonString = http.DownloadString(apiUrl);
                var indicatorsObject = jss.Deserialize<Dictionary<string, object>>(jsonString);
                Dictionary<string, Dictionary<string, string>> dailyIndicators = new Dictionary<string, Dictionary<string, string>>();
                int i = 0;
                foreach (var key in indicatorsObject.Keys.ToArray())
                {
                var item = indicatorsObject[key];
                if (item.GetType().FullName.Contains("System.Collections.Generic.Dictionary"))
                {
                Dictionary<string, object> itemObject = (Dictionary<string, object>)item;
                Dictionary<string, string> indicatorProp = new Dictionary<string, string>();
                int j = 0;
                foreach (var key2 in itemObject.Keys.ToArray())
                {
                indicatorProp.Add(key2, itemObject[key2].ToString());
                j++;
                }
                dailyIndicators.Add(key, indicatorProp);
                }
                i++;
                }
                txttcambio.Text = "" + dailyIndicators["dolar"]["valor"];
                }
                catch {
                    txttcambio.Text = "0";
                }

                //---------------------------------------------------------------------

                // aqui busca si hay un id mio y en estado pendiente si encuentro se lo asigna si no le asigna un 0
                //---------------------------------------------------------------------
                Buscar_Asignado();
                string cont = Session["contador"].ToString();
                //---------------------------------------------------------------------




                // aqui se valida si es distinto a 0 se asigna al txtid si no se busca el ultimo disponible y se asigna
                //---------------------------------------------------------------------
                if (cont != "0")
                {
                txtIdSol.Text = cont.ToString();
                }else{

         
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "SELECT TOP 1 ncontador as contador FROM SolicitudPcc with(nolock) order by ncontador desc";
                dr = cmd.ExecuteReader();
                dr.Read();
                if (dr.HasRows){
                int contador = int.Parse(dr["contador"].ToString()) + 1;
                Session["contador"] = contador.ToString();
                txtIdSol.Text = contador.ToString();
                asignarnumero();

                }else{
                //  no hay registros en la base de datos
                }
                Conn.Close();
                }
                //---------------------------------------------------------------------

            }


        calcular_Montos();

        }
        



        public void asignarnumero()//asigna numero si no tengo ninguno pendiente 
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "INSERT INTO SolicitudPcc(Empresa,Usuario,Fecha_Ingreso,tcambio,Estado,ncontador)VALUES('','" + Session["Usuario"] + "','','','2'," + Session["contador"] + ")";
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
        }




        public void Buscar_Asignado() // busca si hay alguno asignado con mi usuario y me asigna el mismo 
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT ncontador FROM SolicitudPcc with(nolock) where Usuario ='" + Session["Usuario"] + "' and Estado = '2'";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                Session["contador"] = dr["ncontador"].ToString();
            }
            else
            {
                Session["contador"] = "0";
            }
            Conn.Close();

            txtIdSol.Text = Session["contador"].ToString();

        }


        public void calcular_Montos()//calcula el monto total de los registros 
        {
            txtIdSol.Text = Session["contador"].ToString();
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT sum(MontoCC) as montousd  FROM DetallePago with(nolock) where id_SolPCC = '" + txtIdSol.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            string val = dr["montousd"].ToString();

            if (val != "")
            {
                txtTotalusd.Text = dr["montousd"].ToString();
            }
            else
            {
                txtTotalusd.Text = "0";
            }
            //se calcula monto bruto en pesos y los porcentajes hasta el neto 
            double montbruto = Convert.ToDouble(txtTotalusd.Text) * Convert.ToDouble(txttcambio.Text);
            CultureInfo elGR = CultureInfo.CreateSpecificCulture("el-GR");
            Console.WriteLine(montbruto.ToString("0,0", elGR));
            txtbruto.Text = String.Format(elGR, "{0:0,0}", montbruto);
            double porc = Convert.ToDouble(txtbruto.Text) * 0.10;
            Console.WriteLine(porc.ToString("0,0", elGR));
            txt10porc.Text = String.Format(elGR, "{0:0,0}", porc);
            double liq = Convert.ToDouble(txtbruto.Text) - Convert.ToDouble(txt10porc.Text);
            Console.WriteLine(porc.ToString("0,0", elGR));
            txtliq.Text = String.Format(elGR, "{0:0,0}", liq);
            Conn.Close();
            ddlempecheq.DataBind();
        }



        protected void gvDetalle_SelectedIndexChanged(object sender, EventArgs e)
        {
            int eliminar = int.Parse(gvDetalle.SelectedValue.ToString());
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "DELETE FROM DetallePago  WHERE id_DetallePCC = '" + eliminar + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            gvDetalle.DataBind();
            calcular_Montos();
            Conn.Close();
        }

        protected void Btn_Grabar_ServerClick(object sender, EventArgs e)
        {

            //le q1uitamos las comas al decimal y le ponemos un punto para registrara en al bd 
            string maskValores = "###########.##";
            string formateado = Convert.ToDecimal(txtmontocc.Text).ToString(maskValores, CultureInfo.GetCultureInfo("en-US"));
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "INSERT INTO DetallePago(id_SolPCC,id_CodEmpresa,Fecha_Factura,N_Operacion,N_Factura,MontoCC,Profit_Neto,PorcWTI,Observacion) VALUES ('" + Session["contador"] + "','" + ddlempresa.SelectedValue + "','" + txtfechafact.Text + "','" + txtnoper.Text + "','" + txtnfact.Text + "','" + formateado + "','" + txtprofit.Text + "','" + txtporcwti.Text + "','" + txtobserv.Text + "')";
            dr = cmd.ExecuteReader();
            dr.Read();
            gvDetalle.DataBind();
            txtfechafact.Text = "";
            txtmontocc.Text = "";
            txtnfact.Text = "";
            txtnoper.Text = "";
            txtobserv.Text = "";
            txtporcwti.Text = "";
            txtprofit.Text = "";
            txtTotalusd.Text = "";
            Conn.Close();
            calcular_Montos();
     
        }

   
        protected void txttcambio_TextChanged(object sender, EventArgs e)
        {
        calcular_Montos();
        }

        protected void Btn_Registrar_ServerClick(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            DateTime Hoy = DateTime.Today;
            string maskValores = "###########.##";
            string formateado = Convert.ToDecimal(txttcambio.Text).ToString(maskValores, CultureInfo.GetCultureInfo("en-US"));
            if (cbautopant.Checked == true){
                cmd.CommandText = "UPDATE SolicitudPcc SET NBoleta='" + txtnboleta.Text + "', Empresa = '" + rbEmpresas.SelectedValue + "',Usuario = '" + Session["Usuario"] + "',Fecha_Ingreso = '" + Hoy.ToString("yyyy-MM-dd") + "',tcambio = '" + formateado + "',Estado = 'Pendiente Auditor',empcheque = '" + ddlempecheq.SelectedValue + "',echequea = '" + txtechequea.Text + "',cargo = '" + txtcargo.Text + "',eboletaa = '" + txteboleta.Text + "',comexcontact = '" + txtcomex.Text + "',retiracheque = '" + txtretira.Text + "' ,  autorizasinpago= '1'    WHERE ncontador = '" + txtIdSol.Text + "'";
            }else{
                cmd.CommandText = "UPDATE SolicitudPcc SET NBoleta='" + txtnboleta.Text + "', Empresa = '" + rbEmpresas.SelectedValue + "',Usuario = '" + Session["Usuario"] + "',Fecha_Ingreso = '" + Hoy.ToString("yyyy-MM-dd") + "',tcambio = '" + formateado + "',Estado = 'Solicitado',empcheque = '" + ddlempecheq.SelectedValue + "',echequea = '" + txtechequea.Text + "',cargo = '" + txtcargo.Text + "',eboletaa = '" + txteboleta.Text + "',comexcontact = '" + txtcomex.Text + "',retiracheque = '" + txtretira.Text + "',  autorizasinpago= '0'  WHERE ncontador = '" + txtIdSol.Text + "'";
            }
            dr = cmd.ExecuteReader();
            dr.Read();
            Conn.Close();
            mail();

            txtnboleta.Text = "";
            txtechequea.Text = "";
            txtcargo.Text = "";
            txteboleta.Text = "";
            txtcomex.Text = "";
            txtretira.Text = "";

            Response.Redirect("~/PagoCC/MisSolicitudes.aspx");
        }


        public void mail()
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT id_Mail,UserMail,PassMail,FirmaMail,PuertoMail,ServerMail FROM Mail with(nolock)";
            dr = cmd.ExecuteReader();
            dr.Read();
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient("" + dr["ServerMail"].ToString() + "");
            mail.From = new MailAddress("" + dr["UserMail"].ToString() + "", "" + Session["Nombre"] + " ", Encoding.UTF8);
            mail.IsBodyHtml = true;
            mail.Subject = "Se Ha Registrado Solicitud Pago CC  Numero : " + txtIdSol.Text + " ";
            DateTime Hoy = DateTime.Today;
            mail.Body = ("<strong> El Usuario " + Session["Nombre"].ToString() + " ha Registrado Una Solicitud de Pago CC con Fecha : " + Hoy.ToString("dd-MM-yyyy") + "<br/><br/><br/><br/><br/>" + dr["FirmaMail"].ToString() + "");
            mail.To.Add("" + Session["Correo"] + "");
            SmtpServer.Port = int.Parse(dr["PuertoMail"].ToString());
            SmtpServer.Credentials = new System.Net.NetworkCredential("" + dr["UserMail"].ToString() + "", "" + dr["PassMail"].ToString() + "");
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            Conn.Close();

        }


    }
}