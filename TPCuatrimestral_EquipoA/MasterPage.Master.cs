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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        List<Inmueble> misInmuebles;
        protected void Page_Load(object sender, EventArgs e) //ejecuta cada vez que se carga la página
        {
            if (!IsPostBack) //Verifica si la página se carga por primera vez o si se carga por una acción del usuario
            {
                GetInmuebles();
            }
            else
            {
                misInmuebles = (List<Inmueble>)Session["inmuebles"];
            }
        }

        private void GetInmuebles()
        {
            InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
            List<Inmueble> misInmuebles = inmuebleNegocio.listar();
            ImagenesNegocio imagenesNegocio = new ImagenesNegocio();
            List<Imagen> misImagenes = imagenesNegocio.listar();
            imagenesNegocio.vincularImagenes(misInmuebles, misImagenes);
            if (Session["inmuebles"] == null)
            {
                Session.Add("inmuebles", misInmuebles);
            }
            else
            {
                Session["inmuebles"] = misInmuebles;
            }

        }

        protected void btnAlquilar_Click(object sender, EventArgs e)
        {
            string disponibilidad = "Alquiler";
            string localidad = "todas";
            string tipoPropiedad = "todas";

            // Almacenar los filtros en la sesión
            Session["FiltroDisponibilidad"] = disponibilidad;
            Session["FiltroLocalidad"] = localidad;
            Session["FiltroTipoPropiedad"] = tipoPropiedad;
            // Redirigir a la página de resultados
            Response.Redirect("Resultados.aspx");
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            string disponibilidad = "Venta";
            string localidad = "todas";
            string tipoPropiedad = "todas";

            // Almacenar los filtros en la sesión
            Session["FiltroDisponibilidad"] = disponibilidad;
            Session["FiltroLocalidad"] = localidad;
            Session["FiltroTipoPropiedad"] = tipoPropiedad;
            // Redirigir a la página de resultados
            Response.Redirect("Resultados.aspx");
        }
    }
}