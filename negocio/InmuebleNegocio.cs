using System;
using System.Collections.Generic;
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
            List<Inmueble> lista = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT * FROM dbo.VW_DatosInmuebles");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    Ubicacion aux2 = new Ubicacion();

                    aux.ID = (int)datos.Lector["ID"];
                    aux.Tipo = (string)datos.Lector["TIPO"];
                    aux2.Direccion = (string)datos.Lector["DIRECCION"];
                    aux2.Localidad = (string)datos.Lector["LOCALIDAD"];
                    aux.Ubicacion = aux2;
                    aux.Metros2 = (int)datos.Lector["METROS2"];
                    aux.Metros2Cubiertos = (int)datos.Lector["METROS2CUBIERTOS"];
                    aux.Disponibilidad = (string)datos.Lector["DISPONIBILIDAD"];
                    aux.Ambientes = (int)datos.Lector["AMBIENTES"];
                    aux.Baños = (int)datos.Lector["BAÑOS"];
                    aux.Precio = (decimal)datos.Lector["PRECIO"];
                    aux.Descripcion = (string)datos.Lector["DESCRIPCION"];
                    aux.Estado = (bool)datos.Lector["ESTADO"];

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

        public int obtenerIDInmueble()
        {
            AccesoDatos datos = new AccesoDatos();
            Inmueble nuevo = new Inmueble();

            try
            {
                datos.setConsulta("SELECT * FROM Inmuebles WHERE ID = (SELECT MAX(ID) FROM Inmuebles);");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    nuevo.ID = (int)datos.Lector["Id"];
                }

                return nuevo.ID;

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
            List<Inmueble> lista = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT * FROM dbo.VW_DatosInmuebles "; // guardo toda consulta
                // lo que quiero traer son los filtros aplicados
                //

                if (disponibilidad == "Compra")
                {
                    disponibilidad = "Venta";
                }

                consulta += "WHERE DISPONIBILIDAD = '" + disponibilidad + "' ";

                if (localidad == "todas" || localidad == "")
                {
                    //no hace nada
                } else 
                {
                    consulta += "AND LOCALIDAD LIKE '" + localidad + "%' ";
                }

                if (tipo == "todas")
                {
                    //no hace nada
                }
                else
                {
                    consulta += "AND TIPO = '" + tipo + "'";
                }
                
                datos.setConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    Ubicacion aux2 = new Ubicacion();

                    aux.ID = (int)datos.Lector["ID"];
                    aux.Tipo = (string)datos.Lector["TIPO"];
                    aux2.Direccion = (string)datos.Lector["DIRECCION"];
                    aux2.Localidad = (string)datos.Lector["LOCALIDAD"];
                    aux.Ubicacion = aux2;
                    aux.Metros2 = (int)datos.Lector["METROS2"];
                    aux.Metros2Cubiertos = (int)datos.Lector["METROS2CUBIERTOS"];
                    aux.Disponibilidad = (string)datos.Lector["DISPONIBILIDAD"];
                    aux.Ambientes = (int)datos.Lector["AMBIENTES"];
                    aux.Baños = (int)datos.Lector["BAÑOS"];
                    aux.Precio = (decimal)datos.Lector["PRECIO"];
                    aux.Descripcion = (string)datos.Lector["DESCRIPCION"];
                    aux.Estado = (bool)datos.Lector["ESTADO"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }
        
    }

}