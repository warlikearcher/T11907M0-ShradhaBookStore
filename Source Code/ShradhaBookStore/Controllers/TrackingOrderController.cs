using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using ShradhaBookStore.Models;
namespace ShradhaBookStore.Controllers
{
    public class TrackingOrderController : Controller
    {
        private readonly ProjectContext context;
        public TrackingOrderController(ProjectContext context)
        {
            this.context = context;
        }

        public IActionResult Index(string search)
        {
            var Idsuer = HttpContext.Session.GetInt32("id");
            if (Idsuer == null)
            {
                return RedirectToAction("Login", "UserInfo");
            }
            else
            {
                var joins = (from i in context.Order
                             join j in context.OrderDetails
                             on i.OrderNo equals j.OrderNo
                             where j.UserID == Idsuer
                             select new DetailsOrder
                             {
                                 order = i,
                                 orderDetail = j
                             }).Distinct().ToList();
                if (!string.IsNullOrEmpty(search))
                {
                    var SelectedItem = joins.Where(m => m.orderDetail.order_number.Equals(search)).Distinct().ToList();
                    ViewBag.CheckItem = SelectedItem;
                    foreach (var item in SelectedItem)
                    {
                        var checks = context.OrderDetails.Where(o => o.order_number.Equals(search));
                        if (checks == null)
                        {
                            ViewBag.CheckItem = null;
                            ViewBag.Ordernumber = search;
                        }
                        else
                        {
                            if (item.order.Status == "Order is Denight!")
                            {
                                //ViewBag.Cancle = "This order have been cancle";
                                ViewBag.Deny = "test";
                                ViewBag.Ordernumber = 1;
                                //ViewBag.Ordernumber = item.orderDetail.order_number;
                            }
                            else if ((item.order.Status == "Order not confirm") || (item.order.Status == "Order is confirm"))
                            {
                                var shipping = context.Shipping.Where(s => s.OrderNo.Equals(item.order.OrderNo)).SingleOrDefault();
                                ViewBag.DeliveredStatus = shipping.Delivered;
                                ViewBag.DeliverinnStatus = shipping.Delivering;
                                ViewBag.Date = item.order.OrderPlaced;
                                ViewBag.from = item.order.From;
                                ViewBag.OrderNo = item.order.OrderNo;
                                ViewBag.to = item.order.To;
                                ViewBag.OrderStatus = item.order.Status;
                                ViewBag.Ordernumber = item.orderDetail.order_number;
                            }
                            else
                            {
                                ViewBag.Cancle = "test";
                                ViewBag.Ordernumber = 1;
                            }
                            //ViewBag.Deny = "The order was rejected for a number of reasons: The product is out";



                        }

                    }

                    var SelectPrice = context.OrderDetails.Where(s => s.order_number.Equals(search)).Select(d => d.Price).Sum();
                    ViewBag.Price = SelectPrice.ToString("c");
                }
            }

            return View();
        }


        public IActionResult ClearOrder(int id)
        {
            var Find = context.Order.Where(m => m.OrderNo.Equals(id)).SingleOrDefault();
            if (Find == null)
            {
                return RedirectToAction("Error", "Order");
            }
            else
            {
                Find.Status = "Order being cancle";
                context.SaveChanges();
                return Ok(id);
            }

        }
        public IActionResult Test()
        {
            return View();
        }
        public IActionResult Action(string id)
        {
            var getItem = from i in context.OrderDetails
                          join j in context.Product
                          on i.ProductCode equals j.ProductCode
                          where i.order_number.Equals(id)
                          select new Shippingorder
                          {
                              detail = i,
                              product = j
                          };
            var model = from i in getItem
                        select i;
            ViewBag.GetItem = model.ToList();
            return View();
        }
    }

}
