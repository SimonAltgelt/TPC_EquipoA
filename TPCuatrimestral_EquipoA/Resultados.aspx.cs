﻿using dominio;
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
        public Usuario miUsuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                miUsuario = (Usuario)Session["Usuario"];
            }
            if (!IsPostBack)
            {
                string disponibilidad = (string)Session["disponibilidad"];
                string localidad = (string)Session["localidad"];
                string tipoPropiedad = (string)Session["tipoPropiedad"];
                obtenerInmuebles(disponibilidad, localidad, tipoPropiedad);
                repetidorInmuebles.DataSource = (List<Inmueble>)Session["inmuebles"];
                repetidorInmuebles.DataBind();
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

        protected void btnFavoritos_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string IDInmueble = btn.CommandArgument;
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("Exec SP_AdministrarFavorito @IDUsuario, @IDInmueble");
                datos.setParametros("@IDUsuario", miUsuario.ID);
                datos.setParametros("@IDInmueble", IDInmueble);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        protected string obtenerPrimerImagen(object imagenes)
        {
            var imagenList = imagenes as List<Imagen>; // Adjust 'YourImageType' to the actual type of images
            if (imagenList != null && imagenList.Count > 0)
            {
                return imagenList[0].URLImagen;
            }
            return "https://images.posthousing.com/nophoto.png"; // Default image URL
        }
    } 
}
