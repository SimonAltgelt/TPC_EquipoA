using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
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
        /*
        public List<Inmueble> listarFiltrados(string campo, string criterio)
        {
            List<Inmueble> lista = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion AS Descripcion, M.Descripcion AS Marca, C.Descripcion AS Categoria, Precio, M.Id AS IDMarca, C.Id AS IDCategoria FROM Inmuebles AS A, Marcas AS M, Categorias AS C  WHERE M.Id = A.IdMarca AND C.Id = A.IdCategoria ";
                if (campo == "Precio")
                {
                    switch (criterio)
                    {
                        case "Ascendente":
                            consulta += "ORDER BY Precio ASC";
                            break;
                        case "Descendente":
                            consulta += "ORDER BY Precio DESC";
                            break;
                    }
                }
                else if (campo == "Categoría")
                {
                    consulta += "AND C.Descripcion = '" + criterio + "' ";
                }
                else if (campo == "Marca")
                {
                    consulta += "AND M.Descripcion = '" + criterio + "' ";
                }

                datos.setConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble aux = new Inmueble();

                    aux.IDInmueble = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    aux.Marca = new Marca();
                    aux.Marca.Nombre = (string)datos.Lector["Marca"];
                    aux.Marca.IDMarca = (int)datos.Lector["IDMarca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];
                    aux.Categoria.IDCategoria = (int)datos.Lector["IDCategoria"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }*/
    }
}