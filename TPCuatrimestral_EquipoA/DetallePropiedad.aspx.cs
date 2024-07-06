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
    public partial class DetallePropiedad : System.Web.UI.Page
    {
        public Inmueble miInmueble;
        public string fechaSeleccionada = "";
        public string turno = "";
        public string hora = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) //Verifica si la página se carga por primera vez o si se carga por una acción del usuario
            {
                int id = int.Parse(Request.QueryString["id"]);
                miInmueble = ((List<Inmueble>)Session["inmuebles"]).Find(x => x.ID == id);
                Session["inmueble"] = miInmueble;

                if (Session["Fecha"] == null)
                {
                    Session.Add("Fecha", "");
                }
            }
            else
            {
                miInmueble = (Inmueble)Session["inmueble"];
                fechaSeleccionada = (string)Session["fecha"];
                LblCapturaDia.Text = "";
            }

            if (Session["usuario"] != null)
            {
                Usuario miUsuario = (Usuario)Session["usuario"];
                if (!IsPostBack)
                {
                    txtNombre.Text = miUsuario.Nombre;
                    txtApellido.Text = miUsuario.Apellido;
                    txtTelefono.Text = miUsuario.Telefono;
                    txtEmail.Text = miUsuario.Email;
                }
            }
        }

        protected void Confirmar_Click(object sender, EventArgs e)
        {
            if (TurnoMañana.Checked)
            {
                turno = "m";
                hora = "9:00";
            }
                
                
            else if (TurnoMediodia.Checked)
            {
                turno = "d";
                hora = "11:30";
            }
                
            else if (TurnoTarde.Checked)
            {
                turno = "t";
                hora = "14:00";
            }
                
            
            if (string.IsNullOrEmpty(turno) || string.IsNullOrEmpty(fechaSeleccionada))
            {
                LblCapturaDia.Text = "Seleccione un turno por favor.";
                return;
            }

            Usuario miUsuario = (Usuario)Session["usuario"];

            AccesoDatos datos = new AccesoDatos();

            datos.setConsulta("Exec SP_ComprobarTurno @Fecha, @Turno;");
            datos.setParametros("@Fecha", fechaSeleccionada);
            datos.setParametros("@Turno", turno);
            int resultado = datos.ejecutarScalar();
            datos.cerrarConexion();
            if (resultado > 0)
            {
                LblCapturaDia.Text = "El turno no está disponible, elija otro por favor.";
            }
            else
            {
                AccesoDatos datos2 = new AccesoDatos();

                try
                {
                    
                    datos2.setConsulta("Exec SP_InsertarTurno @Fecha, @Turno, @IDUsuario, @IDInmueble;");
                    datos2.setParametros("@Fecha", fechaSeleccionada);
                    datos2.setParametros("@Turno", turno);
                    datos2.setParametros("@IDUsuario", miUsuario.ID.ToString());
                    datos2.setParametros("@IDInmueble", miInmueble.ID.ToString());
                    datos2.ejecutarAccion();
                }
                catch (Exception ex)
                {
                    Session.Add("error", "Hubo un error al reservar tu turno, inténtalo otra vez.");
                    Response.Redirect("Error.aspx", false);
                }
                finally
                {
                    datos2.cerrarConexion();
                }
                LblCapturaDia.Text = "¡Reservaste un turno para el día " + fechaSeleccionada + "!";

                EmailService emailService = new EmailService();
                emailService.ArmarEmail(miUsuario.Email, "¡Reservaste un turno para visitar un inmueble!", "¡Hola " + miUsuario.Nombre + "! Reservaste un turno para visitar el inmueble ubicado en " + miInmueble.Ubicacion.Direccion + ", " + miInmueble.Ubicacion.Localidad + ", para el día " + fechaSeleccionada + " a las " + hora + " horas. ¡Te esperamos!");

                emailService.EnviarEmail();
                string script = "alert(¡Gracias por enviarnos tu consulta!');";
                ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
            }
        }

        protected void Calendario_SelectionChanged(object sender, EventArgs e)
        {
            fechaSeleccionada = Calendario.SelectedDate.ToString("MM/dd/yyyy");
            Session["fecha"] = fechaSeleccionada;
        }

        protected void Calendario_DayRender(object sender, DayRenderEventArgs e)
        {
            if(e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.LightGray;
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();
            emailService.ArmarEmail(txtEmail.Text, "Consulta sobre el inmueble " + miInmueble.ID.ToString(), txtConsulta.Text);

            emailService.EnviarEmail();
            string script = "alert('¡Gracias por enviarnos tu consulta!');";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}