﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPCuatrimestral_EquipoA
{
    public class Inmueble
    {
        public int ID { get; set; }

        public string Tipo { get; set; }

        public int Vendedor { get; set; }
        public string Ubicacion{ get; set; }

        public string Disponibilidad { get; set; }
        
        public int Metros2 { get; set; }

        public int Metros2Cubiertos { get; set; }

        public int Ambientes { get; set; }
    
        public int Baños { get; set; }

        public decimal Precio { get; set; }

        public string Descripcion { get; set; }

        public bool Estado { get; set; }
    }
}