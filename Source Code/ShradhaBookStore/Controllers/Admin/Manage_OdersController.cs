using Microsoft.AspNetCore.Mvc;
using ShradhaBookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace ShradhaBookStore.Controllers
{
    public class Manage_OdersController : Controller
    {

        private readonly ProjectContext context;
        public Manage_OdersController(ProjectContext context)
        {
            this.context = context;
        }
        public IActionResult Index(int? table_search)
        {
            var item = (from o in context.Order
                        where o.Status == "Order not confirm"
                        select o);
            //item = item.Where(p => p.order.Status.Contains("Order not confirm"));
            var model = from i in item
                        select i;

            if (item != null && item.Count() > 0)
            {
                if (TempData["Error"] != null)
                {
                    ViewBag.Messenger = TempData["Error"];
                    ViewBag.OrderList = model.ToList();
                }
                else if (TempData["Errorss"] != null)
                {
                    ViewBag.Messenger = TempData["Errorss"];
                    ViewBag.OrderList = model.ToList();
                }
                if (table_search.HasValue)
                {
                    ViewBag.OrderList = model.Where(m => m.OrderNo.ToString().Contains(table_search.ToString())).ToList();
                }
                ViewBag.OrderList = model.ToList();
                return View("~/Views/Admin/Manage_Oders/Index.cshtml");
            }
            else
            {
                ViewBag.OrderList = model.ToList();
                TempData["msg"] = "<script>alert('Null list!!');</script>";
                return View("~/Views/Admin/Manage_Oders/Index.cshtml");
            }

        }

        public IActionResult Order_Cancle(int? table_search)
        {
            var item = (from o in context.Order
                        where o.Status == "Order being cancle"
                        select o);
            //item = item.Where(p => p.order.Status.Contains("Order not confirm"));
            var model = from i in item
                        select i;

            if (item != null || item.Count() > 0)
            {
                if (table_search.HasValue)
                {
                    model = model.Where(m => m.OrderNo.ToString().Contains(table_search.ToString()));
                }
                return View("~/Views/Admin/Manage_Oders/Order_Cancle.cshtml", model.ToList());
            }
            else
            {
                TempData["msg"] = "<script>alert('Null list!!');</script>";
                return View("~/Views/Admin/Manage_Oders/Order_Cancle.cshtml", model.ToList());
            }
        }


        public IActionResult ShowProduct(int id)
        {
            var getItem = from i in context.OrderDetails
                          join j in context.Product
                          on i.ProductCode equals j.ProductCode
                          where i.OrderNo.Equals(id)
                          select new Shippingorder
                          {
                              detail = i,
                              product = j
                          };
            var model = from i in getItem
                        select i;

            ViewBag.Model = model.ToList();
            return View("~/Views/Admin/Manage_Oders/ShowProduct.cshtml");
        }




        public IActionResult Manrage_Denine_Oders(int? table_search)
        {
            var item = from i in context.Order
                       where i.Status == "Order is Denight!"
                       select i;
            if (item != null && item.Count() > 0)
            {
                if (table_search.HasValue)
                {
                    item = item.Where(m => m.OrderNo.ToString().Contains(table_search.ToString()));
                }
                return View("~/Views/Admin/Manage_Oders/Manrage_Denine_Oders.cshtml", item.ToList());
            }
            else
            {
                TempData["msg"] = "<script>alert('Null list!!');</script>";
                return View("~/Views/Admin/Manage_Oders/Manrage_Denine_Oders.cshtml", item.ToList());
            }



        }

        public IActionResult Shipping(int? table_search)
        {
            var item = (from i in context.Shipping
                        join o in context.Order
                        on i.OrderNo equals o.OrderNo
                        where o.Status == "Order is confirm"
                        select i);
            if (item != null && item.Count() > 0)
            {
                if (table_search.HasValue)
                {
                    item = item.Where(m => m.OrderNo.ToString().Contains(table_search.ToString()));
                }
                return View("~/Views/Admin/Manage_Oders/Shipping.cshtml", item.ToList());
            }
            else
            {
                TempData["msg"] = "<script>alert('Null list!!');</script>";
                return View("~/Views/Admin/Manage_Oders/Shipping.cshtml", item.ToList());
            }

        }

        public IActionResult OrderLog(int? table_search)
        {
            var item = from i in context.Order
                       where i.Status == "Order is confirm"
                       select i;
            //var item = context.Order
            //    join 
            //    .Where(m => m.Status == "Order is confirm");
            if (item != null && item.Count() > 0)
            {
                if (table_search.HasValue)
                {
                    item = item.Where(m => m.OrderNo.ToString().Contains(table_search.ToString()));
                }
                return View("~/Views/Admin/Manage_Oders/OrderLog.cshtml", item.ToList());
            }
            else
            {
                TempData["msg"] = "<script>alert('Null list!!');</script>";
                return View("~/Views/Admin/Manage_Oders/OrderLog.cshtml", item.ToList());
            }


            //where i.Status == "Order is confirm"
        }


        public IActionResult Accept1(int id)
        {
            var shipping = context.Shipping.Where(m => m.id.Equals(id)).SingleOrDefault();
            if (shipping == null)
            {
                return RedirectToAction("Shipping");
            }
            else
            {
                shipping.Delivering = true;
                context.SaveChanges();
            }
            return RedirectToAction("Shipping");
        }
        public IActionResult Accept2(int id)
        {
            var shipping = context.Shipping.Where(m => m.id.Equals(id)).SingleOrDefault();
            if (shipping == null)
            {
                return RedirectToAction("Manage_Orders");
            }
            else
            {
                shipping.Delivered = true;
                context.SaveChanges();
            }
            return RedirectToAction("Shipping");
        }


        public IActionResult AcceptOrder(int id)
        {
            var item = context.Order.Where(OrderNo => OrderNo.OrderNo.Equals(id)).SingleOrDefault();
            var checkked = from i in context.OrderDetails
                          join a in context.Product
                          on i.ProductCode equals a.ProductCode
                          select new DetailsOrder {
                              product = a,
                              orderDetail = i
                          };
            var models = (from i in checkked select i).ToList();
            foreach (var Tem2 in models)
            {
                var product = context.Product.Where(d => d.ProductCode.Equals(Tem2.orderDetail.ProductCode)).ToList();
                if (product == null)
                {
                    return RedirectToAction("Error", "Order");
                }

                foreach (var item2 in product)
                {
                    var quantity = item2.Quantity - Tem2.orderDetail.Amount;
                    if (item2.Quantity == 0)
                    {
                        item2.Quantity = 0;
                        context.SaveChanges();
                        TempData["Error"] = "Order No. '" + id + "' Some products are not in stock enough to supply or are out of stock,please choose Show Product to check";
                        return RedirectToAction("Index");
                    }
                    else if (quantity < 0)
                    {
                        TempData["Errorss"] = "Order No. '" + id + "' Some products are not in stock enough to supply or are out of stock,please choose Show Product to check";
                        return RedirectToAction("Index");
                    }
                    item2.Quantity = quantity;
                }
            }
            context.SaveChanges();
            if (item.Status == "Order is confirm")
            {
                ViewBag.Alert = "Order is active!";
            }
            else
            {
                if (item == null)
                {
                    ViewBag.Error = "Id not exited!!!!";
                }
                else
                {
                    item.Status = "Order is confirm";
                    context.SaveChanges();
                }

            }
            return RedirectToAction("Index");
        }

        //////public IActionResult PutMessenger()
        //////{
        //////    var mess = HttpContext.Session.GetString("Mess");
        //////    if (mess != null)
        //////    {
        //////        List<Messenger> dataCart = JsonConvert.DeserializeObject<List<Messenger>>(mess);
        //////        ViewBag.Getitem = dataCart;
        //////    }
        //////    return View("~/Views/Admin/Manage_Oders/PutMessenger.cshtml");

        //////}

        public IActionResult Denight(int id)
        {
            var item = context.Order.Where(OrderNo => OrderNo.OrderNo.Equals(id)).SingleOrDefault();
            if (item == null)
            {
                ViewBag.Error = "Id not exited!!!!";
            }
            else if (item.Status == "Order not confirm")
            {
                item.Status = "Order is Denight!";
                context.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        public IActionResult RemoveSession()
        {
            HttpContext.Session.Remove("Mess");
            return RedirectToAction("~/Views/Admin/Manage_Oders/Index.cshtml");
        }
    }
}
