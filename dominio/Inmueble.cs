using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TPCuatrimestral_EquipoA
{
    public class Inmueble
    {
        public int ID { get; set; }

        public int IDTipo { get; set; }

        public int IDUbicacion { get; set; }

        public int IDDisponibilidad { get; set; }
        
        public int Metros2 { get; set; }

        public int Metros2Cubiertos { get; set; }

        public int Ambientes { get; set; }
    
        public int Baños { get; set; }

        public float Precio { get; set; }

        public string Descripcion { get; set; }

        public bool Estado { get; set; }
    }
}