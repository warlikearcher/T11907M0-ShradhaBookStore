using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

using ShradhaBookStore.Models;
using X.PagedList;
using X.PagedList.Mvc;

namespace ShradhaBookStore.Controllers
{
    public class HomeController : Controller
    {
        private readonly  ProjectContext context;
        public HomeController(ProjectContext context)
        {
            this.context = context;
        }

        public IActionResult Index()
        {
            var banner = context.Banner.OrderByDescending(p=>p.CreateAt).ToList().Take(3);
            var list = context.Product.ToList();
            ViewBag.GetProduct = list;
            ViewBag.GetBanner = banner;

            //Lasted
            var lasted = list.OrderByDescending(p => p.CreateAt).Take(10);
            ViewBag.Lasted = lasted;

            //Popular
            var orderByResult = (from s in context.OrderDetails
                                 group s by s.ProductCode into g
                                 orderby g.Count() descending
                                 select new { ProductCode = g.Key, Count = g.Count() }).Take(10);

            var flist = from p in list
                        join o in orderByResult on p.ProductCode equals o.ProductCode
                        select new ViewProduct
                        {
                            Product = p

                        };
            ViewBag.popularList = flist;

            return View();
        }

        public IActionResult ShopePage(string searchText, string sortby, int? page,string Category,bool secondhand,int? minPrice,int? maxPrice)
        {
            var listProduct = from p in context.Product
                              join c in context.Category on p.CategoryCode equals c.CategoryCode
                              join pb in context.Publisher on p.PublisherCode equals pb.PublisherCode
                              select new ViewProduct
                              {
                                  Product = p,
                                  Category = c,
                                  Publisher = pb
                              };

            int pageSize = 8;
            int pageNumber = (page ?? 1);
            //Get Category
            var clist = context.Category.ToList();
            ViewBag.GetCategory = clist;
            try
            {
                if(secondhand == true)
                {
                    listProduct = listProduct.Where(p => p.Product.Used == true);
                }
                if (!string.IsNullOrEmpty(Category))
                {
                    listProduct = listProduct.Where(
                                        p => p.Product.CategoryCode.Equals(Category));
                    if (listProduct.Count() == 0)
                    {
                        TempData["msg"] = "<script>alert('"+Category+" not found');</script>";
                        return RedirectToAction("ShopePage", "Home");
                    }
                }
                if (!string.IsNullOrEmpty(searchText))
                {
                    listProduct = listProduct.Where(
                                        p => p.Product.ProductName.ToLower().Contains(searchText)
                                        || p.Product.AuthorName.ToUpper().Contains(searchText)
                                        || p.Category.CategoryName.Contains(searchText)
                                        || p.Publisher.PublisherName.Contains(searchText)
                                        );
                    if (listProduct.Count() == 0)
                    {
                        TempData["msg"] = "<script>alert('Cannot find corresponding product of" + searchText + "');</script>";
                        return RedirectToAction("ShopePage", "Home");
                    }
                }
                if((minPrice >=0) && (maxPrice > minPrice))
                {
                    listProduct = listProduct.Where(p => p.Product.Price >= minPrice);
                    listProduct = listProduct.Where(p => p.Product.Price <= maxPrice);
                }

                if (!string.IsNullOrEmpty(sortby))
                {
                    switch (sortby)
                    {

                        case "AZ":
                            listProduct = listProduct.OrderBy(x => x.Product.ProductName);

                            break;
                        case "ZA":
                            listProduct = listProduct.OrderByDescending(x => x.Product.ProductName);
                            break;
                        case "LH":
                            listProduct = listProduct.OrderBy(x => x.Product.Price);
                            break;
                        case "HL":
                            listProduct = listProduct.OrderByDescending(x => x.Product.Price);
                            break;
                        default:
                            listProduct = listProduct.OrderBy(x => x.Product.ProductName);
                            break;
                    }
                }

                ViewBag.productList = listProduct.ToPagedList(pageNumber, pageSize);
            }
            catch (Exception ex)
            {

                ViewBag.Msg = ex.Message;
            }
            return View();
        }

        public IActionResult Detail(string id)
        {
            var product = context.Product.Where(c => c.ProductCode.Equals(id)).FirstOrDefault();
            
            if (product == null)
            {
                TempData["msg"] = "<script>alert('This product does not exist');</script>";
                return RedirectToAction("Index", "Home");
            }
            ViewBag.GetInfoProduct = product;

            var publisher = context.Publisher.Where(p => p.PublisherCode.Equals(product.PublisherCode)).FirstOrDefault();
            ViewBag.Getpublisher = publisher;
            var category = context.Category.Where(c => c.CategoryCode.Equals(product.CategoryCode)).FirstOrDefault();
            ViewBag.Getcategory = category;


            var plist = context.Product.ToList();
            ViewBag.GetProduct = plist;

            var orderByResult = (from s in context.OrderDetails
                                 group s by s.ProductCode into g
                                 orderby g.Count() descending
                                 select new { ProductCode = g.Key, Count = g.Count() }).Take(10);

            var flist = from p in plist
                        join o in orderByResult on p.ProductCode equals o.ProductCode
                        select new ViewProduct
                        {
                            Product = p

                        };
            ViewBag.productList = flist;

            // Rate
            var ru = from u in context.UserInfo
                     join r in context.RatingReview
                     on u.UserID equals r.UserId
                     select new ViewProduct
                     {
                         UserInfo = u,
                         RatingReview = r

                     };
            var rate = ru.Where(p => p.RatingReview.ProductCode.Equals(id)).OrderByDescending(p=>p.RatingReview.CreateAt).ToList();
            ViewBag.rate = rate;

            return View();
        }

        [HttpGet]
        public IActionResult CreateView()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult CreateView(RatingReview rating)
        {
            rating.CreateAt = DateTime.Now;
            context.RatingReview.Add(rating);
            context.SaveChanges();
            string pid = rating.ProductCode;
            return RedirectToAction("Detail", "Home",new { id = pid });
        }
        public IActionResult ContactUs()
        {
            return View();
        }

    }
}
