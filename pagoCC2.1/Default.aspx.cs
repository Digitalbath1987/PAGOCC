using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pagoCC2._1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Btn_Login_ServerClick(object sender, EventArgs e)
        {
            SqlConnection Conn = new SqlConnection();
            Conn.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["PagosCC.Properties.Settings.Cadena"].ToString();
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            Conn.Open();
            cmd.Connection = Conn;
            cmd.CommandText = "SELECT Nombre,Usuario,Contraseña,Correo,Eliminar,Modificar,Registrar,Mantenedor,Finanzas,Auditoria,FullRegistros FROM Usuarios where Usuario = '" + txt_User.Text + "' and Contraseña = '" + txt_Pass.Text + "' ";
            dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                Session["Nombre"] = dr["Nombre"].ToString();
                Session["Usuario"] = dr["Usuario"].ToString();
                Session["Correo"] = dr["Correo"].ToString();
                Session["Eliminar"] = dr["Eliminar"].ToString();
                Session["Modificar"] = dr["Modificar"].ToString();
                Session["Registrar"] = dr["Registrar"].ToString();
                Session["Mantenedor"] = dr["Mantenedor"].ToString();
                Session["Finanzas"] = dr["Finanzas"].ToString();
                Session["Auditoria"] = dr["Auditoria"].ToString();
                Session["FullRegistros"] = dr["FullRegistros"].ToString();
                Conn.Close();
                Response.Redirect("~/Home.aspx");


            }
            else
            {
                Response.Write("usuario o contraseña erroneo");

            }
            Conn.Close();
        }







    }
}