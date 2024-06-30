using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_EquipoA
{
    public partial class LoginExitoso : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Si no estas logueado no te permite navegar. Para evitar que puedas poner la url y entres sin login*/
            if (Session["Usuario"] == null)
            {
                Session.Add("error", "Debes iniciar sesión para ingresar");
                Response.Redirect("Error", false);
                /*Podemos poner un boton de login o directamente redireccionar a la pag de login*/
            }
           
        }
        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx");
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}