using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Mantenedor
{
    public partial class Cod_Empresa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                cmd.CommandText = "UPDATE CodEmpr SET RUT = '" + txtrutod.Text + "',Nombre_Emp = '" + txtnomemprmod.Text + "',Codigo_Emp = '" + txtcodemprmod.Text + "',EChequeA = '" + txtemicheqmod.Text + "',Cargo = '" + txtcargomod.Text + "',RetiraCheque = '" + txtreticheqmod.Text + "',Comex = '" + txtcontcomexmod.Text + "' WHERE id_Codigo = '" + Session["codempremod"] + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                Conn.Close();
            

                lblmensaje_ok.Visible = true;
                lblmensaje_nook.Visible = false;

                gvEmpresas.DataBind();

            }
            else
            {
            
                lblmensaje_ok.Visible = false;
                lblmensaje_nook.Visible = true;

            }

        }
        
        protected void gvEmpresas_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["codempremod"] = int.Parse(gvEmpresas.SelectedValue.ToString());
            string script = @"window.location.href = '#modalHtml';";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT id_Codigo,RUT,Nombre_Emp,Codigo_Emp,EChequeA,Cargo,Email,RetiraCheque,Comex  FROM CodEmpr with(nolock) where id_Codigo = '" + Session["codempremod"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            txtrutod.Text = dr["RUT"].ToString();
            txtnomemprmod.Text = dr["Nombre_Emp"].ToString();
            txtcodemprmod.Text = dr["Codigo_Emp"].ToString();
            txtemicheqmod.Text = dr["EChequeA"].ToString();
            txtcargomod.Text = dr["Cargo"].ToString();
            txtreticheqmod.Text = dr["RetiraCheque"].ToString();
            txtcontcomexmod.Text = dr["Comex"].ToString();

            Conn.Close();
        }

        protected void Registrar_Click(object sender, EventArgs e)
        {
            string validar = Session["Mantenedor"].ToString();//validar si posee permisos
            if (validar == "SI")
            {
                SqlConnection Conn = new SqlConnection();
                Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                Conn.Open();
                cmd.Connection = Conn;
                cmd.CommandText = "INSERT INTO CodEmpr(RUT,Nombre_Emp,Codigo_Emp,EChequeA,Cargo,Email,RetiraCheque,Comex)VALUES('" + txtrut.Text + "','" + txtnombreemp.Text + "','" + txtcodempr.Text + "' ,'" + txtemitircha.Text + "','" + txtcargo.Text + "','" + txtemail.Text + "','" + txtretiracheque.Text + "','" + txtcontaccomex.Text + "')";
                dr = cmd.ExecuteReader();
                dr.Read();
                gvEmpresas.DataBind();
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
