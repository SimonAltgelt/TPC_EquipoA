using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Net;

namespace negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient("smtp.gmail.com", 587);
            server.Credentials = new NetworkCredential("lusiviinmobiliaria@gmail.com", "lusivi.2024");
            server.EnableSsl = false;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void ArmarEmail(string emailOrigen, string asunto, string mensaje) 
        {
            email = new MailMessage();
            email.From = new MailAddress("lusiviinmobiliaria@gmail.com");// el from mail del usuario
            email.To.Add(emailOrigen);
            email.Subject = asunto;
            email.Body = mensaje;
            email.IsBodyHtml = true;
        }

        public void EnviarEmail()
        {
        try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}