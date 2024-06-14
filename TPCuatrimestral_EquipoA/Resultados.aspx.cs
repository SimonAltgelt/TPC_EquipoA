using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_EquipoA
{
    public partial class Resultados : System.Web.UI.Page
    {
        public List<Inmueble> misInmuebles;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string disponibilidad = (string)Session["FiltroDisponibilidad"];
                string localidad = (string)Session["FiltroLocalidad"];
                string tipoPropiedad = (string)Session["FiltroTipoPropiedad"];
                GetInmuebles(disponibilidad, localidad, tipoPropiedad);
            }
            misInmuebles = (List<Inmueble>)Session["inmuebles"];
        }

        private void GetInmuebles(string disponibilidad, string localidad, string tipoPropiedad)
        {
            InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
            List<Inmueble> todosInmuebles = inmuebleNegocio.listar();
            ImagenesNegocio imagenesNegocio = new ImagenesNegocio();
            List<Imagen> misImagenes = imagenesNegocio.listar();
            imagenesNegocio.vincularImagenes(todosInmuebles, misImagenes);

            
            var inmueblesFiltrados = todosInmuebles.Where(i =>
                (string.IsNullOrEmpty(disponibilidad) || i.Disponibilidad == disponibilidad) &&
                (string.IsNullOrEmpty(localidad) || i.Ubicacion.Localidad.Contains(localidad)) &&
                (string.IsNullOrEmpty(tipoPropiedad) || i.Tipo == tipoPropiedad)
            ).ToList();

            Session["inmuebles"] = inmueblesFiltrados;
        }
    } 
}
