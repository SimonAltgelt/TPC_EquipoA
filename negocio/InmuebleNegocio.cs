using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI.WebControls;
using dominio;

namespace negocio
{
    public class InmuebleNegocio
    {
        public List<Inmueble> listar()
        {
            List<Inmueble> listaInmuebles = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT * FROM dbo.VW_DatosInmuebles WHERE ESTADO=1");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Ubicacion ubicacion = new Ubicacion();

                    inmueble.ID = (int)datos.Lector["ID"];
                    inmueble.Tipo = (string)datos.Lector["TIPO"];
                    ubicacion.Direccion = (string)datos.Lector["DIRECCION"];
                    ubicacion.Localidad = (string)datos.Lector["LOCALIDAD"];
                    inmueble.Ubicacion = ubicacion;
                    inmueble.Metros2 = (int)datos.Lector["METROS2"];
                    inmueble.Metros2Cubiertos = (int)datos.Lector["METROS2CUBIERTOS"];
                    inmueble.Disponibilidad = (string)datos.Lector["DISPONIBILIDAD"];
                    inmueble.Ambientes = (int)datos.Lector["AMBIENTES"];
                    inmueble.Baños = (int)datos.Lector["BAÑOS"];
                    inmueble.Precio = formatearDecimal((decimal)datos.Lector["PRECIO"]);
                    inmueble.Descripcion = (string)datos.Lector["DESCRIPCION"];
                    inmueble.Estado = (bool)datos.Lector["ESTADO"];
                    listaInmuebles.Add(inmueble);
                }
                return listaInmuebles;
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

        public List<Inmueble> listarFiltrados(string disponibilidad, string localidad, string tipo)
        {
            List<Inmueble> listaInmuebles = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = "SELECT * FROM dbo.VW_DatosInmuebles WHERE ESTADO=1";

                if (disponibilidad == "Compra")
                {
                    disponibilidad = "Venta";
                }

                consulta += " AND DISPONIBILIDAD = '" + disponibilidad + "' ";

                if (localidad != "todas" && localidad != "")
                {
                    consulta += " AND LOCALIDAD LIKE '" + localidad + "%' ";
                }

                if (tipo != "todas")
                {
                    consulta += "AND TIPO = '" + tipo + "'";
                }
                
                datos.setConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Ubicacion ubicacion = new Ubicacion();

                    inmueble.ID = (int)datos.Lector["ID"];
                    inmueble.Tipo = (string)datos.Lector["TIPO"];
                    ubicacion.Direccion = (string)datos.Lector["DIRECCION"];
                    ubicacion.Localidad = (string)datos.Lector["LOCALIDAD"];
                    inmueble.Ubicacion = ubicacion;
                    inmueble.Metros2 = (int)datos.Lector["METROS2"];
                    inmueble.Metros2Cubiertos = (int)datos.Lector["METROS2CUBIERTOS"];
                    inmueble.Disponibilidad = (string)datos.Lector["DISPONIBILIDAD"];
                    inmueble.Ambientes = (int)datos.Lector["AMBIENTES"];
                    inmueble.Baños = (int)datos.Lector["BAÑOS"];
                    inmueble.Precio = formatearDecimal((decimal)datos.Lector["PRECIO"]);
                    inmueble.Descripcion = (string)datos.Lector["DESCRIPCION"];
                    inmueble.Estado = (bool)datos.Lector["ESTADO"];
                    listaInmuebles.Add(inmueble);
                }
                return listaInmuebles;
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

        public void ocultar(int IDInmueble)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("UPDATE INMUEBLES SET ESTADO = 0 WHERE ID = " + IDInmueble + "");
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
        }

        public void desocultar(int IDInmueble)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("UPDATE INMUEBLES SET ESTADO = 1 WHERE ID = " + IDInmueble + "");
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
        }

        public List<Inmueble> listarOcultos()
        {
            List<Inmueble> listaInmuebles = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT * FROM dbo.VW_DatosInmuebles WHERE ESTADO=0");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Ubicacion ubicacion = new Ubicacion();

                    inmueble.ID = (int)datos.Lector["ID"];
                    inmueble.Tipo = (string)datos.Lector["TIPO"];
                    ubicacion.Direccion = (string)datos.Lector["DIRECCION"];
                    ubicacion.Localidad = (string)datos.Lector["LOCALIDAD"];
                    inmueble.Ubicacion = ubicacion;
                    inmueble.Metros2 = (int)datos.Lector["METROS2"];
                    inmueble.Metros2Cubiertos = (int)datos.Lector["METROS2CUBIERTOS"];
                    inmueble.Disponibilidad = (string)datos.Lector["DISPONIBILIDAD"];
                    inmueble.Ambientes = (int)datos.Lector["AMBIENTES"];
                    inmueble.Baños = (int)datos.Lector["BAÑOS"];
                    inmueble.Precio = formatearDecimal((decimal)datos.Lector["PRECIO"]);
                    inmueble.Descripcion = (string)datos.Lector["DESCRIPCION"];
                    inmueble.Estado = (bool)datos.Lector["ESTADO"];
                    listaInmuebles.Add(inmueble);
                }
                return listaInmuebles;
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

        public void modificar(Inmueble viejo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("Exec SP_Modificar_Inmueble @ID, @Tipo, @Direccion, @Localidad, @Precio, @Descripcion, @Metros2, @Metros2Cubiertos, @Ambientes, @Baños, @Disponibilidad");
                datos.setParametros("@ID", viejo.ID);
                datos.setParametros("@Tipo", viejo.Tipo);
                datos.setParametros("@Direccion", viejo.Ubicacion.Direccion);
                datos.setParametros("@Localidad", viejo.Ubicacion.Localidad);
                datos.setParametros("@Precio", viejo.Precio);
                datos.setParametros("@Descripcion", viejo.Descripcion);
                datos.setParametros("@Metros2", viejo.Metros2);
                datos.setParametros("@Metros2Cubiertos", viejo.Metros2Cubiertos);
                datos.setParametros("@Ambientes", viejo.Ambientes);
                datos.setParametros("@Baños", viejo.Baños);
                datos.setParametros("@Disponibilidad", viejo.Disponibilidad);
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
        }

        public void agregar(Inmueble nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("Exec SP_Agregar_Inmueble @Tipo, @Direccion, @Localidad, @Precio, @Descripcion, @Metros2, @Metros2Cubiertos, @Ambientes, @Baños, @Disponibilidad");
                datos.setParametros("@Tipo", nuevo.Tipo);
                datos.setParametros("@Direccion", nuevo.Ubicacion.Direccion);
                datos.setParametros("@Localidad", nuevo.Ubicacion.Localidad);
                datos.setParametros("@Precio", nuevo.Precio);
                datos.setParametros("@Descripcion", nuevo.Descripcion);
                datos.setParametros("@Metros2", nuevo.Metros2);
                datos.setParametros("@Metros2Cubiertos", nuevo.Metros2Cubiertos);
                datos.setParametros("@Ambientes", nuevo.Ambientes);
                datos.setParametros("@Baños", nuevo.Baños);
                datos.setParametros("@Disponibilidad", nuevo.Disponibilidad);
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
        }

        public int obtenerIDInmueble()
        {
            AccesoDatos datos = new AccesoDatos();
            Inmueble ultimoInmueble = new Inmueble();

            try
            {
                datos.setConsulta("SELECT * FROM Inmuebles WHERE ID = (SELECT MAX(ID) FROM Inmuebles);");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    ultimoInmueble.ID = (int)datos.Lector["Id"];
                }
                return (int)ultimoInmueble.ID;
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

        string formatearDecimal(decimal precio)
        {
            NumberFormatInfo nfi = new CultureInfo("es-ES", false).NumberFormat;
            nfi.NumberDecimalSeparator = ",";
            nfi.NumberGroupSeparator = ".";

            return precio.ToString("N2", nfi);
        }

        public List<Inmueble> listarFavoritos(int IDUsuario)
        {
            List<Inmueble> listaInmuebles = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SP_ListarFavoritos @IDUsuario");
                datos.setParametros("@IDUsuario", IDUsuario);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble inmueble = new Inmueble();
                    Ubicacion ubicacion = new Ubicacion();

                    inmueble.ID = (int)datos.Lector["ID"];
                    inmueble.Tipo = (string)datos.Lector["TIPO"];
                    ubicacion.Direccion = (string)datos.Lector["DIRECCION"];
                    ubicacion.Localidad = (string)datos.Lector["LOCALIDAD"];
                    inmueble.Ubicacion = ubicacion;
                    inmueble.Metros2 = (int)datos.Lector["METROS2"];
                    inmueble.Metros2Cubiertos = (int)datos.Lector["METROS2CUBIERTOS"];
                    inmueble.Disponibilidad = (string)datos.Lector["DISPONIBILIDAD"];
                    inmueble.Ambientes = (int)datos.Lector["AMBIENTES"];
                    inmueble.Baños = (int)datos.Lector["BAÑOS"];
                    inmueble.Precio = formatearDecimal((decimal)datos.Lector["PRECIO"]);
                    inmueble.Descripcion = (string)datos.Lector["DESCRIPCION"];
                    inmueble.Estado = (bool)datos.Lector["ESTADO"];
                    listaInmuebles.Add(inmueble);
                }
                return listaInmuebles;
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
    }

}