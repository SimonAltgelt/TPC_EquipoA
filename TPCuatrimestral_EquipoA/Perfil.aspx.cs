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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Usuario miUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            
            miUsuario = (Usuario)Session["usuario"];

            txtNombre.Text = miUsuario.Nombre;
            txtApellido.Text = miUsuario.Apellido;
            txtDocumento.Text = miUsuario.Documento;
            txtDomicilio.Text = miUsuario.Domicilio;
            txtTelefono.Text = miUsuario.Telefono;
            txtEmail.Text = miUsuario.Email;
            txtContraseña.Text = miUsuario.Contraseña;
            imagenPerfil.ImageUrl = miUsuario.ImagenPerfil;
            }
            miUsuario = (Usuario)Session["usuario"];
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {

            /* FALTA TERMINAR LA FUNCION, FALTA MANEJAR VALORES VACÍOS */
            miUsuario.Nombre = txtNombre.Text;
            miUsuario.Apellido = txtApellido.Text;
            miUsuario.Documento = txtDocumento.Text;
            miUsuario.Domicilio = txtDomicilio.Text;
            miUsuario.Telefono = txtTelefono.Text;
            miUsuario.Email = txtEmail.Text;
            miUsuario.Contraseña = txtContraseña.Text;
            miUsuario.ImagenPerfil = imagenPerfil.ImageUrl;

            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarioNegocio.actualizarUsuario(miUsuario);
            Response.Redirect("Default.aspx");

        }
    }
}