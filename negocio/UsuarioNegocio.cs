﻿using dominio;
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
                datos.setConsulta("SELECT ID, TipoUsuario, Apellido, Nombre, Telefono, Documento, Domicilio FROM USUARIOS WHERE Email = @Usuario AND Contraseña = @Contraseña");
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
                datos.setConsulta("exec InsertarUsuario @Nombre, @Apellido, @Email, @Contraseña, @Telefono");
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