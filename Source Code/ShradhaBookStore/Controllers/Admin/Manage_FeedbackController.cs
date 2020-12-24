using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShradhaBookStore.Models;
using Microsoft.AspNetCore.Http;
using System.Net.Mail;
using System.Net;

namespace ShradhaBookStore.Controllers.Admin
{
    public class Manage_FeedbackController : Controller
    {
        private readonly ProjectContext context;
        //private readonly SaveShoppingCartID save;
        public Manage_FeedbackController(ProjectContext context)
        {
            this.context = context;
        }
      
      
        public IActionResult Manage_Feedback()
        {
            var result = context.FeedBack.ToList();
            return View("~/Views/Admin/Manage_Feedback/Manage_Feedback.cshtml", result);


        }
        
        public IActionResult ReplyMail(int id) 
        {   
            var re = context.FeedBack.FirstOrDefault(m => m.FeedBackID.Equals(id));
            HttpContext.Session.SetInt32("UserID", re.FeedBackID);
            HttpContext.Session.SetString("MailTo", re.Email);
            
            return View("~/Views/Admin/Manage_Feedback/ReplyMail.cshtml");
        }
        [HttpPost]
        public IActionResult ReplyMail(Reply reply) 
        {   
            
            context.Reply.Add(reply);
            context.SaveChanges();
            string mailFrom = "nhokli210@gmail.com";
            string passFrom = "loverain01";
            using (MailMessage mm = new MailMessage(mailFrom,HttpContext.Session.GetString("MailTo")))
            {
                mm.Subject = reply.ReplyTitle;
                mm.Body = reply.ReplyMessage;              
                mm.IsBodyHtml = false;
                using (SmtpClient smtp = new SmtpClient())
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential(mailFrom,passFrom);
                    smtp.UseDefaultCredentials = false;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    ViewBag.Message = "Email sent.";
                }
               
            }
            

            return View("~/Views/Admin/Manage_Feedback/ReplyMail.cshtml");
        }
        
        
    }
}
