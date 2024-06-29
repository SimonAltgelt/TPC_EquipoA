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
        public Ubicacion suUbicacion = new Ubicacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                // L.D. 29/06 Si llegamos con un ID, buscamos el inmueble pertinente
                {
                    int id = int.Parse(Request.QueryString["id"]);
                    miInmueble = ((List<Inmueble>)Session["inmuebles"]).Find(x => x.ID == id);

                    ddlTipoPropiedad.Items.FindByText(miInmueble.Tipo).Selected = true;
                    txtDireccion.Text = miInmueble.Ubicacion.Direccion;
                    txtLocalidad.Text = miInmueble.Ubicacion.Localidad;
                    txtPrecio.Text = miInmueble.Precio.ToString();
                    txtDescripcion.Text = miInmueble.Descripcion;
                    MetrosCuadrados.Text = miInmueble.Metros2.ToString();
                    MetrosCubiertos.Text = miInmueble.Metros2Cubiertos.ToString();
                    CantAmbientes.Text = miInmueble.Ambientes.ToString();
                    CantBaños.Text = miInmueble.Baños.ToString();
                    ddlTipoOperacion.Items.FindByText(miInmueble.Disponibilidad).Selected = true;
                }
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
            // L.D. 20/06
            // Le asignamos a miInmueble todos los datos de los campos
            // ES IMPORTANTE VALIDAR
            miInmueble.Tipo = ddlTipoPropiedad.SelectedItem.Text;
            suUbicacion.Direccion = txtDireccion.Text;
            suUbicacion.Localidad = txtLocalidad.Text;
            miInmueble.Ubicacion = suUbicacion;
            miInmueble.Precio = decimal.Parse(txtPrecio.Text);
            miInmueble.Descripcion = txtDescripcion.Text;
            miInmueble.Metros2 = int.Parse(MetrosCuadrados.Text);
            miInmueble.Metros2Cubiertos = int.Parse(MetrosCubiertos.Text);
            miInmueble.Ambientes = int.Parse(CantAmbientes.Text);
            miInmueble.Baños = int.Parse(CantBaños.Text);
            miInmueble.Disponibilidad = ddlTipoOperacion.SelectedItem.Text;
            // L.D. 20/06
            // Dependiendo de si tiene ID asignada, actualizamos la tabla con los nuevos valores o agregamos
            // un nuevo registro
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"]);
                miInmueble.ID = id;
                inmuebleNegocio.modificar(miInmueble);
            }
            else
            {
                inmuebleNegocio.agregar(miInmueble);
            }

            Response.Redirect("Administracion.aspx");
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx");
        }
        protected void subirImagenes_Click(object sender, EventArgs e)
        {
            try
            {
                string ruta = Server.MapPath("./img/");
                txtImagen.PostedFile.SaveAs(ruta + txtImagen.PostedFile.FileName);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }
    }
}