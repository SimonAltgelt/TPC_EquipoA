﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace negocio
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            string conexionLV = "server=(LocalDb)\\MSSQLLocalDB; database=Inmobiliaria; integrated security=true";
            string conexionS = "server=.\\SQLEXPRESS; database=Inmobiliaria; integrated security=true";
            conexion = new SqlConnection(conexionS);
            comando = new SqlCommand();
        }
        public void setConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;

        }
        public void ejecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void ejecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public int ejecutarScalar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                int cantidad = (int)comando.ExecuteScalar();
                return cantidad;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexion.Close();
        }

        public void setParametros(string clave, object valor)
        {
            comando.Parameters.AddWithValue(clave, valor);
        }
    }
}