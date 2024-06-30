using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace dominio
{
    public enum TipoUsuario
    {
        Cliente = 0,
        Administrador = 1
    }
    public class Usuario
    {
        public int ID { get; set; }
        public string Email { get; set; }
        public string Contraseña { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Telefono { get; set; }
        public string Documento { get; set; }
        public string Domicilio { get; set; }
        public TipoUsuario Tipo { get; set; }
        public string ImagenPerfil { get; set; }

        /*Constructor con argumentos*/
        public Usuario(string usuario, string contraseña, bool admin)
        {
            Email = usuario;
            Contraseña = contraseña;
            Tipo = admin ? TipoUsuario.Administrador : TipoUsuario.Cliente;
        }

        /*Constructor vacío*/
        public Usuario() { }
    }
}