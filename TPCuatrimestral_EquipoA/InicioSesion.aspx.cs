using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace TPCuatrimestral_EquipoA
{
    public partial class InicioSesion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin(object sender, EventArgs e)
        {
            //Se crea un objeto de la clase Usuario
            Usuario miusuario;
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {      //Se instancia el objeto con los datos ingresados por el usuario
                miusuario = new Usuario(email.Text, password.Text, false);
                if (negocio.Login(miusuario)) //si el usuario existe en la base de datos
                {
                    Session.Add("usuario", miusuario);
                   
                    Response.Redirect("LoginExitoso.aspx", false);
                }
                else
                {
                    Session.Add("error", "Usuario o contraseña incorrectos");
                    Response.Redirect("Error.aspx", false);
                }
            }
            catch (Exception ex) //Si hay un error, se redirige a la página de error
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}