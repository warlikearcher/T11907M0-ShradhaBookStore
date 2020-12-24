using Microsoft.AspNetCore.Mvc;
using ShradhaBookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace ShradhaBookStore.Controllers
{
   
    public class ProductInfoController : Controller
    {
        private readonly ProjectContext context;
        public ProductInfoController(ProjectContext context)
        {
            this.context = context;
        }
        public IActionResult Index(string id)
        {
            Product product = context.Product.SingleOrDefault(c => c.ProductCode.Equals(id));
            ViewBag.GetInfoProduct = product;
            var plist = context.Product.ToList();
            ViewBag.GetProduct = plist;
            var a = from o in context.OrderDetails
                    select o;


            var itrm = from i in context.Product
                       join j in a
                       on i.ProductCode equals j.ProductCode
                       select new OrderProduct
                       {
                           product = i,

                       };
            return View();
        }
    }
}
