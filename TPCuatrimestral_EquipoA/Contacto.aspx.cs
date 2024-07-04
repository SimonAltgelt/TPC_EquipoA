using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;

namespace TPCuatrimestral_EquipoA
{
    public partial class Contacto : System.Web.UI.Page
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
            EmailService emailService = new EmailService();
            emailService.ArmarEmail(txtEmail.Text, txtAsunto.Text, txtConsulta.Text);

            emailService.EnviarEmail();
            string script = "alert(¡Gracias por enviarnos tu consulta!');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

            /*try
            {
                emailService.EnviarEmail();
                string script = "alert(¡Gracias por enviarnos tu consulta!');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);

            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }*/
        }
    }
}