using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public class Imagen
    {
        public int ID { get; set; }
        public int IDInmueble { get; set; }
        public string URLImagen { get; set; }
        public string Descripcion { get; set; }
    }
}