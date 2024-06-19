using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_EquipoA
{
    public partial class InmuebleAdmin : System.Web.UI.Page
    {
        public Inmueble miInmueble;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                miInmueble = ((List<Inmueble>)Session["inmuebles"]).Find(x => x.ID == id);

                tipoPropiedad.Text = miInmueble.Tipo;
                txtDireccion.Text = miInmueble.Ubicacion.Direccion;
                txtLocalidad.Text = miInmueble.Ubicacion.Localidad;
                txtPrecio.Text = miInmueble.Precio.ToString();
                txtDescripcion.Text = miInmueble.Descripcion;
                MetrosCuadrados.Text = miInmueble.Metros2.ToString();
                MetrosCubiertos.Text = miInmueble.Metros2Cubiertos.ToString();
                CantAmbientes.Text = miInmueble.Ambientes.ToString();
                CAntBaños.Text = miInmueble.Baños.ToString();
                ddlTipoOperacion.SelectedValue = miInmueble.Disponibilidad;

             

            }
               
        }
    }
}