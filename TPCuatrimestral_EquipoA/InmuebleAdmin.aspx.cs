﻿using dominio;
using negocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_EquipoA
{
    public partial class InmuebleAdmin : System.Web.UI.Page
    {
        public Inmueble miInmueble = new Inmueble();
        public Ubicacion suUbicacion = new Ubicacion();
        public InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
        public ImagenesNegocio imagenesNegocio = new ImagenesNegocio();
        public List<Imagen> imagenesSubidas = new List<Imagen>();


        public int IDInmueble;
        public bool esNuevo=true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            // L.D. 29/06 Si llegamos con un ID, buscamos el inmueble pertinente
            {
                esNuevo = false;
                IDInmueble = int.Parse(Request.QueryString["id"]);
                miInmueble = ((List<Inmueble>)Session["inmuebles"]).Find(x => x.ID == IDInmueble);

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

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
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
            if (!esNuevo)
            {
                IDInmueble = int.Parse(Request.QueryString["id"]);
                miInmueble.ID = IDInmueble;
                inmuebleNegocio.modificar(miInmueble);
            }
            else
            {
                inmuebleNegocio.agregar(miInmueble);
                IDInmueble = inmuebleNegocio.obtenerIDInmueble();
            }

            string ruta = Server.MapPath("./img/");
            if (txtImagen.HasFiles)
            {
                foreach (HttpPostedFile imagenSubida in txtImagen.PostedFiles)
                {
                    string fileName = Path.GetFileNameWithoutExtension(imagenSubida.FileName) + "-" + IDInmueble.ToString();
                    string fullPath = ruta + fileName + ".jpg";
                    imagenSubida.SaveAs(fullPath);

                    Imagen imagen = new Imagen();
                    imagen.IDInmueble = IDInmueble;
                    imagen.URLImagen = "img/" + fileName + ".jpg";
                    imagenesSubidas.Add(imagen);
                }
            }

            imagenesNegocio.agregarImagenes(imagenesSubidas, IDInmueble);

            Response.Write("<script>alert('Inmueble agregado correctamente.');window.location = 'Administracion.aspx';</script>");
            // Debería redirigir a una página que diga carga exitosa
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx");
        }
    }
}