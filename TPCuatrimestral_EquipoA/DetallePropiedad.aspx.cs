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
        public string fechaSeleccionada = "05-07-2024";
        public string turno;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //Verifica si la página se carga por primera vez o si se carga por una acción del usuario
            {
                int id = int.Parse(Request.QueryString["id"]);
                miInmueble = ((List<Inmueble>)Session["inmuebles"]).Find(x => x.ID == id);
                Session["inmueble"] = miInmueble;
            }
            else
            {
                miInmueble = (Inmueble)Session["inmueble"];
            }
        }

        protected void Confirmar_Click(object sender, EventArgs e)
        {
            if (TurnoMañana.Checked)
                turno = "m";
            else if (TurnoMediodia.Checked)
                turno = "d";
            else if (TurnoTarde.Checked)
                turno = "t";

            // ACTUALMENTE LA FECHA ESTÁ HARDCODEADA, NO LA LEVANTA CORRECTAMENTE DEL CALENDARIO

            AccesoDatos datos = new AccesoDatos();

            datos.setConsulta("Exec SP_ComprobarTurno @fecha, @turno;");
            datos.setParametros("@fecha", fechaSeleccionada);
            datos.setParametros("turno", turno);
            int resultado = datos.ejecutarScalar();
            datos.cerrarConexion();
            if (resultado > 0)
            {
                // ACTUALIZAR UN LABEL QUE DIGA "El turno no está disponible, elige otro por favor."
            }
            else
            {
                AccesoDatos datos2 = new AccesoDatos();

                try
                {
                    
                    datos2.setConsulta("Exec SP_InsertarTurno @fecha, @turno;");
                    datos2.setParametros("@fecha", fechaSeleccionada);
                    datos2.setParametros("turno", turno);
                    datos2.ejecutarAccion();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    datos2.cerrarConexion();
                }
            }
        }

        protected void Calendario_SelectionChanged(object sender, EventArgs e)
        {
            // ACTUALMENTE LA FECHA ESTÁ HARDCODEADA, NO LA LEVANTA CORRECTAMENTE DEL CALENDARIO
            LblCapturaDia.Text = Calendario.SelectedDate.ToString("dd/MM/yyyy");
            fechaSeleccionada = Calendario.SelectedDate.ToString("dd/MM/yyyy");
        }
    }
}