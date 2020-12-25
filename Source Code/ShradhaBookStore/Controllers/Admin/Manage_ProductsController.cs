
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using ShradhaBookStore.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System.IO;
using X.PagedList;
using X.PagedList.Mvc;

namespace ShradhaBookStore.Controllers.Admin
{
    public class Manage_ProductsController : Controller
    {
        private ProjectContext context;
        public Manage_ProductsController(ProjectContext context)
        {
            this.context = context;
        }
        public IActionResult Manage_Products(string txtSearch,string sortby, string currentFilter, int? page)
        {
            var listProduct = (from p in context.Product
                               join c in context.Category on p.CategoryCode equals c.CategoryCode
                               join pb in context.Publisher on p.PublisherCode equals pb.PublisherCode
                               select new ViewProduct
                               {
                                   Product = p,
                                   Category = c,
                                   Publisher = pb
                               });

            if (!String.IsNullOrEmpty(txtSearch))
            {
                listProduct = listProduct.Where(p => p.Product.ProductName.ToUpper().Contains(txtSearch.ToUpper()));
            }

            int pageSize = 5;
            int pageNumber = (page ?? 1);

            ViewBag.listProduct = listProduct.ToPagedList(pageNumber, pageSize);

            return View("~/Views/Admin/Manage_Products/Manage_Products.cshtml");
        }
     
        public IActionResult Create_Product()
        {

            ViewBag.CategoryList = context.Category.ToList();
            ViewBag.PublisherList = context.Publisher.ToList();

            return View("~/Views/Admin/Manage_Products/Create_Product.cshtml");
        }
        [HttpPost]
        public IActionResult Create_Product(string cate, string pub)
        {

            return RedirectToAction("Create_Products", "Manage_Products",new { category = cate, publisher = pub });
        }

        [HttpGet]
        public IActionResult Create_Products(string category, string publisher)
        {
            ViewBag.publisherCode = publisher;
            ViewBag.categoryCode = category;
            try
            {
                if (context.Category.SingleOrDefault(p => p.CategoryCode.Equals(category)) != null)
                {
                    if (context.Publisher.SingleOrDefault(p => p.PublisherCode.Equals(publisher)) != null)
                    {
                        for (int i = 1; i <= 99; i++)
                        {
                            var productCode = "";
                            if (i < 10)
                            {
                                 productCode = category + publisher + "0" + i;
                            }
                            else
                            {
                                 productCode = category + publisher + i;
                            }
                            if (context.Product.SingleOrDefault(p => p.ProductCode.Equals(productCode)) == null)
                            {
                                ViewBag.productCode = productCode;
                                break;
                            }

                        }

                    }
                    else
                    {
                        ViewBag.Msg = publisher;
                        return RedirectToAction("~/Views/Admin/Error/NotFound.cshtml", ViewBag.Msg);
                    }
                }
                else
                {
                    ViewBag.Msg = category;
                    return RedirectToAction("~/Views/Admin/Error/NotFound.cshtml", ViewBag.Msg);
                }
            }
            catch (Exception exx)
            {
                ViewBag.Msg = exx.Message;

            }
            return View("~/Views/Admin/Manage_Products/Create_Products.cshtml");
        }
        [HttpPost]
        public IActionResult Create_Products(Product product, IFormFile file)
        {
           
            if (ModelState.IsValid)
            {
                product.CreateAt = DateTime.Now;
                    if (file.Length > 0)
                    {
                        var filePath = Path.Combine("wwwroot/Image/", file.FileName);
                        var stream = new FileStream(filePath, FileMode.Create);
                        file.CopyToAsync(stream);
                        product.Picture = file.FileName;
                    }
               
                    context.Product.Add(product);
                    context.SaveChanges();




                TempData["msg"] = "<script>alert('Create succesfully');</script>";
                return RedirectToAction("Manage_Products", "Manage_Products");
            }
            TempData["msg"] = "<script>alert('Status invalid');</script>";
            return View("~/Views/Admin/Manage_Products/Create_Products.cshtml");
        }
        [HttpGet]
        public IActionResult Detail_Products(string productId)
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
            var result = listProduct.Where(
                                    p => p.Product.ProductCode.Equals(productId));
            ViewBag.Detail = result;
            return View("~/Views/Admin/Manage_Products/Detail_Products.cshtml", ViewBag.Detail);

        }

        [HttpGet]
        public IActionResult Edit_Products(string productId)
        {
            //List<Category> cate = context.Category.ToList();
            //SelectList cateList = new SelectList(cate, "CategoryCode", "CategoryName");
            //ViewBag.CategoryList = cateList;


            //List<Publisher> pub = context.Publisher.ToList();
            //SelectList pubList = new SelectList(pub, "PublisherCode", "PublisherName");
            //ViewBag.PublisherList = pubList;

            ViewBag.CategoryList = context.Category.ToList();
            ViewBag.PublisherList = context.Publisher.ToList();

            return View("~/Views/Admin/Manage_Products/Edit_Products.cshtml",context.Product.Find(productId));

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit_Products(Product product, IFormFile? file,string proCode)
        {

            if (ModelState.IsValid == true)
            {
                Product result = context.Product.SingleOrDefault(p => p.ProductCode.Equals(product.ProductCode));
                if(result != null)
                {
                    //Check category/Publisher replace ??
                    if (result.CategoryCode != product.CategoryCode || result.PublisherCode != product.PublisherCode)
                    {
                        context.Product.Remove(result);
                        if (file.Length > 0)
                        {
                            var filePath = Path.Combine("wwwroot/Image/", file.FileName);
                            var stream = new FileStream(filePath, FileMode.Create);
                            file.CopyToAsync(stream);
                            product.Picture = file.FileName;
                        }
                        for (int i = 1; i <= 99; i++)
                        {
                            if (i < 10)
                            {
                                proCode = product.CategoryCode + product.PublisherCode + "0" + i;
                            }
                            else
                            {
                                proCode = product.CategoryCode + product.PublisherCode + i;
                            }
                            if (context.Product.SingleOrDefault(p => p.ProductCode.Equals(proCode)) == null)
                            {
                                product.ProductCode = proCode;
                                break;
                            }

                        }
                        product.CreateAt = DateTime.Now;
                        context.Product.Add(product);
                        context.SaveChanges();
                    }
                    else
                    {
                        result.ProductCode = product.ProductCode;
                        result.ProductName = product.ProductName;
                        result.Price = product.Price;
                        result.Quantity = product.Quantity;
                        result.AuthorName = product.AuthorName;
                        result.ReleaseYear = product.ReleaseYear;
                        result.Ver = product.Ver;
                        result.Used = product.Used;
                        result.Review = product.Review;
                        result.CategoryCode = product.CategoryCode;
                        result.PublisherCode = product.PublisherCode;
                        result.CreateAt = DateTime.Now;
                        if (file is null)
                        {
                            result.Picture = result.Picture;
                            context.SaveChanges();
                            TempData["msg"] = "<script>alert('Change succesfully');</script>";
                            return RedirectToAction("Manage_Products", "Manage_Products");
                        }


                        if (file.Length > 0)
                        {
                            var filePath = Path.Combine("wwwroot/Image/", file.FileName);
                            var stream = new FileStream(filePath, FileMode.Create);
                            file.CopyToAsync(stream);
                            product.Picture = file.FileName;
                            result.Picture = product.Picture;
                            context.SaveChanges();
                            TempData["msg"] = "<script>alert('Change succesfully');</script>";
                            return RedirectToAction("Manage_Products", "Manage_Products");
                        }
                       
                    }
                    TempData["msg"] = "<script>alert('Change succesfully');</script>";
                    
                }
                else
                {
                    TempData["msg"] = "<script>alert('Product Code inavlid');</script>";
                    return View("~/Views/Admin/Manage_Products/Manage_Products.cshtml");
                }
                    
                    

            }
            TempData["msg"] = "<script>alert('Status invalid');</script>";
            return View("~/Views/Admin/Manage_Products/Manage_Products.cshtml");
        }


        public IActionResult Remove_Products(string productId)
        {
            var itemFind = context.Product.FirstOrDefault(p => p.ProductCode.Equals(productId));
            if(itemFind != null)
            {
                context.Product.Remove(itemFind);
                context.SaveChanges();
                return RedirectToAction("Manage_Products", "Manage_Products");
            }
            else
            {
                TempData["msg"] = "<script>alert('Product id not found!!');</script>";
                return RedirectToAction("Manage_Products", "Manage_Products");
            }
            
        }


        

        public IActionResult Create_Category()
        {
            return View("~/Views/Admin/Manage_Products/Create_Category.cshtml");
        }
        [HttpPost]
        public IActionResult Create_Category(Category category)
        {
            var result = context.Category.Where(p => p.CategoryCode.Equals(category.CategoryCode));
            var checkName = context.Category.Where(p => p.CategoryName.Equals(category.CategoryName));
            if (checkName == null || checkName.Count()  == 0)
            {
if(result == null || result.Count() == 0)
            {
                context.Category.Add(category);
                context.SaveChanges();
                TempData["msg"] = "<script>alert('Create new Category succesfully');</script>";
                return RedirectToAction("CategoryPublisherList", "Manage_Products");
            }
            else if (result != null || result.Count() > 1)
            {
                TempData["msg"] = "<script>alert('Category code already exist!!');</script>";
                return View("~/Views/Admin/Manage_Products/Create_Category.cshtml");
            }
            }
            else
            {
                TempData["msg"] = "<script>alert('Category name already exist!!');</script>";
                return View("~/Views/Admin/Manage_Products/Create_Category.cshtml");
            }
            
            return View("~/Views/Admin/Manage_Products/Create_Category.cshtml");
        }
        public IActionResult Create_Publisher()
        {
            return View("~/Views/Admin/Manage_Products/Create_Publisher.cshtml");
        }
        [HttpPost]
        public IActionResult Create_Publisher(Publisher publisher)
        {
            var result = context.Publisher.Where(p => p.PublisherCode.Equals(publisher.PublisherCode));
            if (result == null || result.Count() == 0)
            {
                context.Publisher.Add(publisher);
                context.SaveChanges();
                TempData["msg"] = "<script>alert('Create new Publisher succesfully');</script>";
                return RedirectToAction("CategoryPublisherList", "Manage_Products");
            }
            else if (result != null || result.Count() > 1)
            {
                TempData["msg"] = "<script>alert('Publisher Code already exist!!');</script>";
                return View("~/Views/Admin/Manage_Products/Create_Publisher.cshtml");
            }
            return View("~/Views/Admin/Manage_Products/Create_Publisher.cshtml");

        }

        [HttpGet]
        public IActionResult CategoryPublisherList(int? page,int? page2)
        {
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            int pageNumber2 = (page2 ?? 1);
            var cate = context.Category.ToList();
            ViewBag.listCategory = cate.ToPagedList(pageNumber, pageSize);
            var pub = context.Publisher.ToList();
            ViewBag.listPublisher = pub.ToPagedList(pageNumber2, pageSize);
            return View("~/Views/Admin/Manage_Products/CategoryPublisherList.cshtml");
        }
        public IActionResult Remove_Publisher(string publisherCode)
        {
            var itemFind = context.Publisher.FirstOrDefault(p => p.PublisherCode.Equals(publisherCode));
            if (itemFind != null)
            {
                context.Publisher.Remove(itemFind);
                context.SaveChanges();
                TempData["msg"] = "<script>alert('Success delete Publisher!!');</script>";
                return RedirectToAction("CategoryPublisherList", "Manage_Products");
            }
            else
            {
                TempData["msg"] = "<script>alert('Publisher code not found!!');</script>";
                return RedirectToAction("CategoryPublisherList", "Manage_Products");
            }
        }
        public IActionResult Remove_Category(string categoryCode)
        {
            var itemFind = context.Category.FirstOrDefault(p => p.CategoryCode.Equals(categoryCode));
            if (itemFind != null)
            {
                context.Category.Remove(itemFind);
                context.SaveChanges();
                TempData["msg"] = "<script>alert('Success delete Category!!');</script>";
                return RedirectToAction("CategoryPublisherList", "Manage_Products");
            }
            else
            {
                TempData["msg"] = "<script>alert('Category code not found!!');</script>";
                return RedirectToAction("CategoryPublisherList", "Manage_Products");
            }
        }
    }
}
