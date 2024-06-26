﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPCuatrimestral_EquipoA
{
    public partial class DetallePropiedad : System.Web.UI.Page
    {
        public Inmueble miInmueble;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) //Verifica si la página se carga por primera vez o si se carga por una acción del usuario
            {
                int id = int.Parse(Request.QueryString["id"]);
                miInmueble = ((List<Inmueble>)Session["inmuebles"]).Find(x => x.ID == id);
                Session["inmueble"]=miInmueble;
            }
            else
            {
                miInmueble=(Inmueble)Session["inmueble"];
            }
        }

        protected void Confirmar_Click(object sender, EventArgs e)
        {
            // reserva el turno asignado
        }

        protected void Calendario_SelectionChanged(object sender, EventArgs e)
        {
            LblCapturaDia.Text = Calendario.SelectedDate.ToString("dd/MM/yyyy");
        }
    }
}   