using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPCuatrimestral_EquipoA
{
    public partial class Administracion : System.Web.UI.Page
    {
        public List<Inmueble> listaInmuebles;
        public List<Imagen> listaImagenes;
        public InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
        ImagenesNegocio imagenesNegocio = new ImagenesNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {   
            //si no hay un usuario logueado o si el usuario logueado no es un administrador, redirige a la página de error
            if (Session["Usuario"] != null && ((Usuario)Session["Usuario"]).Tipo != TipoUsuario.Administrador)
            {
                Session.Add("error", "No tienes permisos para acceder a esta página");
                Response.Redirect("Error.aspx", false);
            }
            
            if (!IsPostBack)
            {
                obtenerInmuebles();
            }

            if (Request.QueryString["h"] != null) // Aplicamos la opción de ver inmuebles ocultos
            {
                Session["inmuebles"] = inmuebleNegocio.listarOcultos();
                if (InmueblesGridView.Columns[5] is ButtonField buttonField)
                {
                    buttonField.Text = "Visibilizar";
                    buttonField.CommandName = "Visualizar";
                }
            }

            listaInmuebles = (List<Inmueble>)Session["inmuebles"];
            InmueblesGridView.DataSource = listaInmuebles;
            InmueblesGridView.DataBind();

        }
        private void obtenerInmuebles()
        {
            listaInmuebles = inmuebleNegocio.listar();
            listaImagenes = imagenesNegocio.listar();
            imagenesNegocio.vincularImagenes(listaInmuebles, listaImagenes);

            if (Session["inmuebles"] == null)
            {
                Session.Add("inmuebles", listaInmuebles);
            }
            else
            {
                Session["inmuebles"] = listaInmuebles;
            }
        }
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            Response.Redirect("InmuebleAdmin.aspx");
        }

        protected void btnOcultos_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx?h=1");
        }

        protected void btnVisibles_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx");
        }
    }
}