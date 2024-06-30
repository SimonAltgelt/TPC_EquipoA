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
        public bool Login(Usuario miusuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("select ID, TipoUsuario from Usuarios where Email = @Usuario and Contraseña = @Contraseña");
                datos.setParametros("@Usuario", miusuario.Email);
                datos.setParametros("@Contraseña", miusuario.Contraseña);
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    miusuario.ID = (int)datos.Lector["ID"];

                    miusuario.Tipo = (int)(datos.Lector["TipoUsuario"]) == 0 ? TipoUsuario.Cliente : TipoUsuario.Administrador;
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

        public void insertarNuevo(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setConsulta("exec InsertarUsuario @Nombre, @Apellido, @Email, @Contraseña, @Telefono");
                //datos.setConsulta("exec InsertarUsuario @Nombre, @Apellido, @Email, @Contraseña, @Telefono, @ImagenPerfil");
                datos.setParametros("@Nombre", nuevo.Nombre);
                datos.setParametros("@Apellido", nuevo.Apellido);
                datos.setParametros("@Email", nuevo.Email);
                datos.setParametros("@Contraseña", nuevo.Contraseña);
                datos.setParametros("@Telefono", nuevo.Telefono);
                //datos.setParametros("@ImagenPerfil", nuevo.ImagenPerfil);
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