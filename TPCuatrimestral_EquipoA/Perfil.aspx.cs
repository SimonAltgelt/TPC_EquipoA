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
            miUsuario = (Usuario)Session["usuario"];
            if (!IsPostBack) {
                txtNombre.Text = miUsuario.Nombre;
                txtApellido.Text = miUsuario.Apellido;
                txtDocumento.Text = miUsuario.Documento;
                txtDomicilio.Text = miUsuario.Domicilio;
                txtTelefono.Text = miUsuario.Telefono;
                txtEmail.Text = miUsuario.Email;
                txtContraseña.Text = miUsuario.Contraseña;
                if (!string.IsNullOrEmpty(miUsuario.ImagenPerfil))
                {
                    imagenPerfil.ImageUrl = "~/img/" + miUsuario.ImagenPerfil;
                } 
                else
                {
                    imagenPerfil.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                string ruta = Server.MapPath("./img/");
                string nombreImagen = "perfil-" + miUsuario.ID + ".jpg";
                txtImagen.PostedFile.SaveAs(ruta + nombreImagen);

                miUsuario.ImagenPerfil = nombreImagen;
                miUsuario.Nombre = txtNombre.Text;
                miUsuario.Apellido = txtApellido.Text;
                miUsuario.Documento = txtDocumento.Text;
                miUsuario.Domicilio = txtDomicilio.Text;
                miUsuario.Telefono = txtTelefono.Text;
                miUsuario.Email = txtEmail.Text;
                miUsuario.Contraseña = txtContraseña.Text;

                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                usuarioNegocio.actualizarUsuario(miUsuario);

                // Refrescamos el usuario ya guardado en sesión con el actualizado
                // para que figuren los datos actualizados en los campos
                Session["usuario"] = miUsuario; 
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}