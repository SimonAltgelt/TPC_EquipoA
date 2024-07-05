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
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("maria.kowalk@alumnos.frgp.utn.edu.ar", "pass");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp-mail.outlook.com";
        }

        public void ArmarEmail(string emailOrigen, string asunto, string mensaje) 
        {
            email = new MailMessage();
            email.From = new MailAddress("maria.kowalk@alumnos.frgp.utn.edu.ar");
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