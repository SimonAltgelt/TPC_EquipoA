using dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using dominio;


namespace negocio
{
    public class UsuarioNegocio
    {
        public bool Login(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("SELECT ID, TipoUsuario, Apellido, Nombre, Telefono, Documento, Domicilio, ImagenPerfil  FROM USUARIOS WHERE Email = @Usuario AND Contraseña = @Contraseña");
                datos.setParametros("@Usuario", usuario.Email);
                datos.setParametros("@Contraseña", usuario.Contraseña);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    usuario.ID = (int)datos.Lector["ID"];
                    usuario.Tipo = (int)datos.Lector["TipoUsuario"] == 0 ? TipoUsuario.Cliente : TipoUsuario.Administrador;
                    usuario.Nombre = (string)datos.Lector["Nombre"];
                    usuario.Apellido = (string)datos.Lector["Apellido"];
                    usuario.Telefono = (string)datos.Lector["Telefono"];
                    if (!(datos.Lector["Documento"] is DBNull))
                    {
                        usuario.Documento = (string)datos.Lector["Documento"];
                    }
                    if (!(datos.Lector["Domicilio"] is DBNull))
                    {
                        usuario.Domicilio = (string)datos.Lector["Domicilio"];
                    }
                    if (!(datos.Lector["Imagenperfil"] is DBNull))
                    {
                        usuario.ImagenPerfil = (string)datos.Lector["ImagenPerfil"];
                    }
                    return true;
                }
                return false;
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

        public void actualizarUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                /*La consulta*/
                datos.setConsulta("UPDATE USUARIOS SET Nombre = @Nombre, Apellido = @Apellido, Documento = @Documento, " +
                    "Domicilio = @Domicilio, Telefono = @Telefono, Email = @Email, Contraseña = @Contraseña, " +
                    "ImagenPerfil = @ImagenPerfil WHERE ID = @ID");
                datos.setParametros("@Nombre", usuario.Nombre);
                datos.setParametros("@Apellido", usuario.Apellido);
                datos.setParametros("@Documento", usuario.Documento);
                datos.setParametros("@Domicilio", usuario.Domicilio);
                datos.setParametros("@Telefono", usuario.Telefono);
                datos.setParametros("@Email", usuario.Email);
                datos.setParametros("@Contraseña", usuario.Contraseña);
                datos.setParametros("@ImagenPerfil", usuario.ImagenPerfil);
                datos.setParametros("@ID", usuario.ID);
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

        public void insertarNuevo(Usuario nuevoUsuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("exec SP_InsertarUsuario @Nombre, @Apellido, @Email, @Contraseña, @Telefono");
                datos.setParametros("@Nombre", nuevoUsuario.Nombre);
                datos.setParametros("@Apellido", nuevoUsuario.Apellido);
                datos.setParametros("@Email", nuevoUsuario.Email);
                datos.setParametros("@Contraseña", nuevoUsuario.Contraseña);
                datos.setParametros("@Telefono", nuevoUsuario.Telefono);
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
    }
}