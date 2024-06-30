using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPCuatrimestral_EquipoA
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {

        protected void btnAlquilar_Click(object sender, EventArgs e)
        {
            string disponibilidad = "Alquiler";
            string localidad = "todas";
            string tipoPropiedad = "todas";

            Session["disponibilidad"] = disponibilidad;
            Session["localidad"] = localidad;
            Session["tipoPropiedad"] = tipoPropiedad;
            Response.Redirect("Resultados.aspx");
        }
        protected void btnComprar_Click(object sender, EventArgs e)
        {
            string disponibilidad = "Venta";
            string localidad = "todas";
            string tipoPropiedad = "todas";

            Session["disponibilidad"] = disponibilidad;
            Session["localidad"] = localidad;
            Session["tipoPropiedad"] = tipoPropiedad;
            Response.Redirect("Resultados.aspx");
        }
        protected void btnAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx");
        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnContacto_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contacto.aspx");
        }
        protected void btnVender_Click(object sender, EventArgs e)
        {
            Response.Redirect("VentaPropiedad.aspx");
        }
        protected void btnAdmin_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Administracion.aspx");
        }
    }

}