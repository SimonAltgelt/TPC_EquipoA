using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
            Session["disponibilidad"] = disponibilidad;
            Session["localidad"] = localidad;
            Session["tipoPropiedad"] = tipoPropiedad;

            // Redirigir a la página de resultados
            Response.Redirect("Resultados.aspx");
        }
        public static List<string> GetLocations(string prefix)
        {
            List<string> locations = new List<string>();
            string connString = "tu cadena de conexión aquí";

            using (SqlConnection conn = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT LocationName FROM Locations WHERE LocationName LIKE @prefix + '%'", conn))
                {
                    cmd.Parameters.AddWithValue("@prefix", prefix);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            locations.Add(reader["LocationName"].ToString());
                        }
                    }
                }
            }

            return locations;
        }
    }
}
