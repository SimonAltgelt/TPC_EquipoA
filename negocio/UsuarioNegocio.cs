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

                    miusuario.Tipo = (int)(datos.Lector["TipoUsuario"]) == 1 ? TipoUsuario.Cliente : TipoUsuario.Administrador;
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
    }
}