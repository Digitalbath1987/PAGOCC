using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Reportes
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblid.Text = Session["nsolicitud"].ToString();
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = " SELECT id_Solicitud,FORMAT(FAprobFinanz,'dd-MM-yyyy') as FAprobFinanz,FORMAT(FAprobAuditor,'dd-MM-yyyy') as FAprobAuditor,FORMAT(FFinalizaFin,'dd-MM-yyyy') as FFinalizaFin,NFolio,NCheque, NBoleta, Empresa, Usuario,FORMAT(Fecha_Ingreso,'dd-MM-yyyy') as Fecha_Ingreso, tcambio, Estado, ncontador, empcheque, echequea, cargo, eboletaa, comexcontact, retiracheque, autorizasinpago FROM SolicitudPcc with(nolock) where ncontador = '" + lblid.Text + "'";
            dr = cmd.ExecuteReader();
            dr.Read();
            rbempresa.SelectedValue = dr["Empresa"].ToString();
            lblvendedor.Text = dr["Usuario"].ToString();
            lblemprcobro.Text = dr["empcheque"].ToString();
            lblechequea.Text = dr["echequea"].ToString();
            lblcargo.Text = dr["cargo"].ToString();
            lblcontact.Text = dr["comexcontact"].ToString();
            lbleboletaa.Text = dr["eboletaa"].ToString();
            lblretiracheque.Text = dr["retiracheque"].ToString();
            txttcambio.Text = dr["tcambio"].ToString();
            lblestado.Text = dr["Estado"].ToString();
            lblingreso.Text = dr["Fecha_Ingreso"].ToString();
            lblnboleta.Text = dr["NBoleta"].ToString();
            lblnfolio.Text = dr["NFolio"].ToString();
            string estado = dr["autorizasinpago"].ToString();
            lblfinanzas.Text = dr["FAprobFinanz"].ToString();
            lblauditoria.Text = dr["FAprobAuditor"].ToString();
            lblfinalizacion.Text = dr["FFinalizaFin"].ToString();
            lblCheque.Text = dr["NCheque"].ToString();

            if (estado == "1")
            {
                cbautopant.Checked = true;
            }
            string varemp = dr["Empresa"].ToString();
            if (varemp == "World Transport Int Ltda")
            {
                wti.Visible = true;
            }
            else if (varemp == "World Transport Courier Ltda")
            {
                wtc.Visible = true;
            }
            else
            {
                tres.Visible = true;
            }





            Conn.Close();
            calcular_Montos();
        }

        protected void CheckBox3_CheckedChanged(object sender, EventArgs e)
        {

        }
        public void calcular_Montos()//calcula el monto total de los registros 
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT sum(MontoCC) as montousd  FROM DetallePago with(nolock) where id_SolPCC = '" + lblid.Text + "'";
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
        }
    }
}