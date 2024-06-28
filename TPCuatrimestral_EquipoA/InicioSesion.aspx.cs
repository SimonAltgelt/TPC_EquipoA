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
            Usuario miusuario;
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                miusuario = new Usuario(email.Text, password.Text, false);
                if (negocio.Login(miusuario))
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
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}