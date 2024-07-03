using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_EquipoA
{
    public partial class VentaPropiedad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario miUsuario = (Usuario)Session["usuario"];
                txtNombre.Text = miUsuario.Nombre;
                txtApellido.Text = miUsuario.Apellido;
                txtTelefono.Text = miUsuario.Telefono;
                txtEmail.Text = miUsuario.Email;
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            // Función de enviar mail
        }
    }
}