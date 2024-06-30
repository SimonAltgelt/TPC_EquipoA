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
        public List<Inmueble> listaInmuebles;
        public List<Imagen> listaImagenes;
        public InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
        public ImagenesNegocio imagenesNegocio = new ImagenesNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string disponibilidad = (string)Session["disponibilidad"];
                string localidad = (string)Session["localidad"];
                string tipoPropiedad = (string)Session["tipoPropiedad"];
                obtenerInmuebles(disponibilidad, localidad, tipoPropiedad);
            }
            listaInmuebles = (List<Inmueble>)Session["inmuebles"];
        }

        private void obtenerInmuebles(string disponibilidad, string localidad, string tipoPropiedad)
        {
            listaInmuebles = inmuebleNegocio.listarFiltrados(disponibilidad, localidad, tipoPropiedad);
            listaImagenes = imagenesNegocio.listar();
            imagenesNegocio.vincularImagenes(listaInmuebles, listaImagenes);

            Session["inmuebles"] = listaInmuebles;
        }
     
    } 
}
