using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;

namespace negocio
{
    public class ImagenesNegocio
    {
        public List<Imagen> listar()
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT * FROM Imagenes");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.IDInmueble = (int)datos.Lector["IDINMUEBLE"];
                    aux.URLImagen = (string)datos.Lector["URLIMAGEN"];
                    aux.Descripcion = (string)datos.Lector["DESCRIPCION"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void vincularImagenes(List<Inmueble> inmuebles, List<Imagen> imagenes)
        // Vamos artículo por artículo y recorremos todas las imágenes para agregarlas
        // a la lista de imágenes de cada artículo, cuando sea apropiado.
        {
            foreach (Inmueble miInmueble in inmuebles)
            {
                foreach (Imagen miImagen in imagenes)
                {
                    if (miImagen.IDInmueble.ToString() == miInmueble.ID.ToString())
                    {
                        miInmueble.Imagenes.Add(miImagen);
                    }
                }
                if (miInmueble.Imagenes.Count == 0)
                {
                    Imagen miImagen = new Imagen
                    {
                        IDInmueble = miInmueble.ID,
                        URLImagen = "https://images.posthousing.com/nophoto.png"
                    };
                    miInmueble.Imagenes.Add(miImagen);
                }
            }
        }
    }
}