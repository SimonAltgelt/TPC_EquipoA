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
        protected void Page_Load(object sender, EventArgs e)
        {
            imgAvatar.ImageUrl = "https://simg.nicepng.com/png/small/202-2022264_usuario-annimo-usuario-annimo-user-icon-png-transparent.png";
            if (Session["Usuario"] != null)
            {
                Usuario miUsuario = (Usuario)Session["Usuario"];
                if (!string.IsNullOrEmpty(miUsuario.ImagenPerfil))
                {
                    imgAvatar.ImageUrl = "~/img/" + miUsuario.ImagenPerfil;
                }
            }
        }
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
        protected void btnPerfil_Click(object sender, EventArgs e)
        {
            Response.Redirect("Perfil.aspx");
        }

        protected void btnMisFavoritos_Click(object sender, EventArgs e)
        {
            Response.Redirect("MisFavoritos.aspx");
        }

        protected void btnMisTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("MisTurnos.aspx");
        }
    }

}