using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPCuatrimestral_EquipoA
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlTipoPropiedad.Items.Add("Casa");
                ddlTipoPropiedad.Items.Add("Departamento");
                ddlTipoPropiedad.Items.Add("PH");
                ddlTipoPropiedad.Items.Add("Terreno");
                ddlTipoPropiedad.Items.Add("Comercial");

                ddlDisponibilidad.Items.Add("Compra");
                ddlDisponibilidad.Items.Add("Alquiler");
            }
        }

        protected void btnEncontrar_Click(object sender, EventArgs e)
        {
            string disponibilidad = ddlDisponibilidad.SelectedValue;
            string localidad = inputLocalidad.Text;
            string tipoPropiedad = ddlTipoPropiedad.SelectedValue;

            // Almacenar los filtros en la sesión
            Session["FiltroDisponibilidad"] = disponibilidad;
            Session["FiltroLocalidad"] = localidad;
            Session["FiltroTipoPropiedad"] = tipoPropiedad;

            // Redirigir a la página de resultados
            Response.Redirect("Resultados.aspx");
        }
    }
}
