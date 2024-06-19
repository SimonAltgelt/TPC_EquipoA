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
        public List<Inmueble> todoInmueble;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetInmuebles();
            }
            todoInmueble = (List<Inmueble>)Session["inmuebles"];
            InmueblesGridView.DataSource = todoInmueble;
            InmueblesGridView.DataBind();
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
        protected void btnPublicar_Click(object sender, EventArgs e)
        {
            Response.Redirect("InmuebleAdmin.aspx");
        }
    }
}