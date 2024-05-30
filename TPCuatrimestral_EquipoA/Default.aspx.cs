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
            // Rellenar el DropDownList con las opciones
            ddlTipoPropiedad.Items.Add("Casa");
            ddlTipoPropiedad.Items.Add("Departamento");
            ddlTipoPropiedad.Items.Add("Terreno");
            ddlTipoPropiedad.Items.Add("Comercial");

            ddlOperacion.Items.Add("Comprar");
            ddlOperacion.Items.Add("Vender");
            ddlOperacion.Items.Add("Alquilar");
           
        }
    }
}