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
    public partial class MisFavoritos : System.Web.UI.Page
    {
        public List<Inmueble> listaInmuebles;
        public List<Imagen> listaImagenes;
        public InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
        public ImagenesNegocio imagenesNegocio = new ImagenesNegocio();
        public Usuario miUsuario = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            miUsuario = (Usuario)Session["usuario"];
            if (!IsPostBack)
            {
                obtenerFavoritos();
                repetidorFavoritos.DataSource = (List<Inmueble>)Session["favoritos"];
                repetidorFavoritos.DataBind();
            }
            listaInmuebles = (List<Inmueble>)Session["favoritos"];
        }

        private void obtenerFavoritos()
        {
            listaInmuebles = inmuebleNegocio.listarFavoritos(miUsuario.ID);
            listaImagenes = imagenesNegocio.listar();
            imagenesNegocio.vincularImagenes(listaInmuebles, listaImagenes);
            Session["favoritos"] = listaInmuebles;
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
                obtenerFavoritos();
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

    }
}