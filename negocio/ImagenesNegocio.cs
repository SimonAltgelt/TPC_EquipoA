using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;

namespace negocio
{
    public class ImagenesNegocio
    {
        public void agregarImagenes(List<Imagen> imagenesSubidas, int IDInmueble)
        {
            foreach (Imagen nuevaImagen in imagenesSubidas)
            {
                AccesoDatos accesoDatos = new AccesoDatos();
                try
                {
                    
                    accesoDatos.setConsulta("INSERT INTO IMAGENES(IDInmueble, URLImagen) VALUES (@IDINMUEBLE, @URLIMAGEN)");
                    accesoDatos.setParametros("@IDINMUEBLE", IDInmueble);
                    accesoDatos.setParametros("@URLIMAGEN", nuevaImagen.URLImagen);
                    accesoDatos.ejecutarAccion();
                }
                catch (Exception ex )
                {
                    throw ex;
                }
                finally
                {
                    accesoDatos.cerrarConexion();
                }
            }
        }

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
                    //aux.Descripcion = (string)datos.Lector["DESCRIPCION"];

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
                        IDInmueble = (int)miInmueble.ID,
                        URLImagen = "https://images.posthousing.com/nophoto.png"
                    };
                    miInmueble.Imagenes.Add(miImagen);
                }
            }
        }

        /*public void eliminarImagenes(int IDImagen)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("DELETE FROM IMAGENES WHERE ID = @ID");
                datos.setParametros("@ID", IDImagen );
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }*/
    }
}