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
    public partial class InmuebleAdmin : System.Web.UI.Page
    {
        public Inmueble miInmueble = new Inmueble();
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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            if (miInmueble != null)
            {

            }
            else
            {

                miInmueble.Tipo = tipoPropiedad.Text;
                miInmueble.Ubicacion.Direccion = txtDireccion.Text;
                miInmueble.Ubicacion.Localidad = txtLocalidad.Text;
                miInmueble.Precio = decimal.Parse(txtPrecio.Text);
                miInmueble.Descripcion = txtDescripcion.Text;
                miInmueble.Metros2 = int.Parse(MetrosCuadrados.Text);
                miInmueble.Metros2Cubiertos = int.Parse(MetrosCubiertos.Text);
                miInmueble.Ambientes = int.Parse(CantAmbientes.Text);
                miInmueble.Baños = int.Parse(CAntBaños.Text);
                miInmueble.Disponibilidad = ddlTipoOperacion.SelectedValue;

                List<Inmueble> inmuebles = (List<Inmueble>)Session["inmuebles"];
                InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
                inmuebleNegocio.agregar(miInmueble);
                inmuebles.Add(miInmueble);
                Session["inmuebles"] = inmuebles;
            }
        }
    }
}