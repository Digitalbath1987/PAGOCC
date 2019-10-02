using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1.Mantenedor
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                cmd.CommandText = "INSERT INTO Usuarios(Nombre,Usuario,Contraseña,Correo,Eliminar,Modificar,Registrar,Mantenedor,Finanzas,Auditoria)VALUES('" + nombre.Text + "','" + usuario.Text + "','" + contraseña.Text + "','" + mail.Text + "','" + rbelimi.SelectedValue + "','" + rbmodi.SelectedValue + "','" + rbregi.SelectedValue + "','" + rbmant.SelectedValue + "','" + rbfinanzas.SelectedValue + "','" + rbauditoria.SelectedValue + "')";
                dr = cmd.ExecuteReader();
                dr.Read();
                gvusers.DataBind();
                lblmensaje_ok.Visible = true;
                lblmensaje_nook.Visible = false;
                nombre.Text = "";
                usuario.Text = "";
                mail.Text = "";
            }
            else
            {
                lblmensaje_ok.Visible = false;
                lblmensaje_nook.Visible = true;
            }

        }

        protected void gvusers_SelectedIndexChanged(object sender, EventArgs e)
        {


            string validar = Session["Modificar"].ToString();//validar si posee permisos
            if (validar == "SI")
            {
               Session["moduser"] = int.Parse(gvusers.SelectedValue.ToString());
            lblidmoduser.Text = Session["moduser"].ToString();
                // aqui hay que cargar los datos para modificar 
                cargarmod();


                string script = @"window.location.href = '#modalHtml';";
                ScriptManager.RegisterStartupScript(this, typeof(Page), "invocarfuncion", script, true);
            }
            else
            {
                lblmensaje_ok.Visible = false;
                lblmensaje_nook.Visible = true;
            }
        }

        protected void rbregi_SelectedIndexChanged(object sender, EventArgs e)
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
             cmd.CommandText = "UPDATE Usuarios SET  Eliminar = '" + rbmodeli.SelectedValue + "' ,Modificar = '" + rbmodmod.SelectedValue + "' ,Registrar = '" + rbmodreg.SelectedValue + "',Mantenedor = '" + rbmodmant.SelectedValue + "',Finanzas = '" + rbmodfinanz.SelectedValue + "',Auditoria = '" + rbmodaudi.SelectedValue + "'  WHERE  Id_Usuario = '" + Session["moduser"] + "'";
                dr = cmd.ExecuteReader();
                dr.Read();
                Conn.Close();
            gvusers.DataBind();

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
                cmd.CommandText = "DELETE FROM Usuarios WHERE  Id_Usuario = '" + Session["moduser"] + "'";
                dr = cmd.ExecuteReader();
                dr.Read();

                Conn.Close();
               gvusers.DataBind();


            }
            else
            {
                lblmensaje_ok.Visible = false;
                lblmensaje_nook.Visible = true;
            }


        }

        protected void cargarmod()
        {

            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT  Nombre,Usuario,Contraseña,Correo,Eliminar,Modificar,Registrar,Mantenedor,Finanzas,Auditoria,FullRegistros FROM Usuarios with(nolock) where Id_Usuario = '" + Session["moduser"] + "'";
            dr = cmd.ExecuteReader();
            dr.Read();

            lbnombre.Text = dr["Nombre"].ToString();
            rbmodmod.SelectedValue = dr["Modificar"].ToString();
            rbmodeli.SelectedValue = dr["Eliminar"].ToString();
            rbmodfinanz.SelectedValue = dr["Finanzas"].ToString();
            rbmodaudi.SelectedValue = dr["Auditoria"].ToString();
            rbmodmant.SelectedValue = dr["Mantenedor"].ToString();
            rbmodreg.SelectedValue = dr["Registrar"].ToString();
        
            Conn.Close();

        }


    }
}