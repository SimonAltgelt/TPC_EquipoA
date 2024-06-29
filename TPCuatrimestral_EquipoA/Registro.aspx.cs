using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPCuatrimestral_EquipoA
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuario miusuario = new Usuario();
                miusuario.Nombre = txtNombre.Text;
                miusuario.Apellido = txtApellido.Text;
                miusuario.Email = txtEmail.Text;
                miusuario.Contraseña = txtContraseña.Text;
                miusuario.Telefono = txtTel.Text;
                UsuarioNegocio negocio = new UsuarioNegocio();
                negocio.insertarNuevo(miusuario);

                Session.Add("usuario", miusuario); //agregar a la sesion el usuario

                Response.Redirect("Default.aspx");
            }
            catch (Exception ex)
            {

                Session.Add("error", false);
            }
        }
    }
}