using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShradhaBookStore.Models;
using Microsoft.AspNetCore.Session;

namespace ShradhaBookStore.Controllers
{
    public class FeedBackController : Controller
    {

        private readonly ProjectContext context;
        //private readonly SaveShoppingCartID save;
        public FeedBackController(ProjectContext context)
        {
            this.context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult SendFeedBack(int id)
        {
            return View();
        }
        [HttpPost]
        public IActionResult SendFeedBack(FeedBack feedBack)
        {

            try
            {
                    context.FeedBack.Add(feedBack);
                    context.SaveChanges();
                    
                  
            }
            catch (Exception ex)
            {
                ViewBag.error = ex.Message;
            }
            return View();
        }
       
    }
}
