using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ShradhaBookStore.Models;
//using DevExpress;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Json;
using BingMapsRESTToolkit;
using Newtonsoft.Json;

namespace ShradhaBookStore.Controllers
{
    public class OrderController : Controller
    {
        private readonly ProjectContext _appDbContext;
        public OrderController(ProjectContext _appDbContext)
        {
            this._appDbContext = _appDbContext;
        }


        public IActionResult Index()
        {
            var clist = _appDbContext.Category.ToList();
            ViewBag.GetCategory = clist;
            return View();
        }
        public void Clear()
        {
            var cartItems = _appDbContext.Cart.ToList();

            _appDbContext.Cart.RemoveRange(cartItems);

            _appDbContext.SaveChanges();
        }

        public List<Cart> shoppingCartItems { get; set; }

        public List<Cart> GetShoppingCartItems()
        {
            return shoppingCartItems ??
                (shoppingCartItems =
                       _appDbContext.Cart
                           .Include(s => s.product)
                           .ToList());
        }




        private static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public RedirectToActionResult ClearOrder()
        {
            //If có where thì đổi thành where id user :D
            var List = _appDbContext.Order.ToList();

            _appDbContext.Order.RemoveRange(List);

            _appDbContext.SaveChanges();
            return RedirectToAction("Index");
        }

        public IActionResult KiemTraThanhToan()
        {
            var clist = _appDbContext.Category.ToList();
            ViewBag.GetCategory = clist;
            ViewBag.Error = "Mã order này đã dc thanh toán!";
            return View();
        }
        [HttpGet]
        public IActionResult PaymentCreditCard(string OrderNumber)
        {
            //var clist = _appDbContext.Category.ToList();
            //ViewBag.GetCategory = clist;
            var SelectedItem = _appDbContext.OrderDetails.Where(m => m.order_number.Equals(OrderNumber)).Distinct().ToList();
            foreach (var item in SelectedItem)
            {
                var CheckOrder = _appDbContext.Order.Where(s => s.OrderNo.Equals(item.OrderNo)).SingleOrDefault();
                if (CheckOrder.Status == "Order is confirm")
                {
                    return RedirectToAction("Error", "Order");
                }
                else
                {
                    if (SelectedItem == null)
                    {
                        return RedirectToAction("Error");
                    }
                    var ordesss = _appDbContext.OrderDetails.Where(m => m.order_number.Equals(OrderNumber)).ToList();

                    var selecedPrice = ordesss.Select(m => m.Price).Sum();
                    ViewBag.RandomCode = RandomString(50);
                    ViewBag.Money = selecedPrice.ToString("c");
                    ViewBag.OrderNumber = OrderNumber;
                }
            }

            return View();
        }

        [HttpGet]
        public IActionResult CheckOut(string text)
        {
            var clist = _appDbContext.Category.ToList();
            ViewBag.GetCategory = clist;
            int? Userid = Convert.ToInt32(HttpContext.Session.GetInt32("id"));
            if (HttpContext.Session.GetInt32("id") != null)
            {
                var item = from s in _appDbContext.Cart
                           join i in _appDbContext.Product
                           on s.product.ProductCode equals i.ProductCode
                           where s.UserId == Userid
                           select new OrderProduct
                           {
                               Cart = s,
                               product = i
                           };
                var items = GetShoppingCartItems();
                shoppingCartItems = items;
                if (shoppingCartItems.Count == 0)
                {
                    return RedirectToAction("Index", "Cart2");
                }
               
                foreach (var Model in shoppingCartItems)
                {
                  
                    if (Model.product.Quantity == 0)
                    {
                        _appDbContext.Cart.Remove(Model);
                        ViewBag.hetSanPhamRoi = "Some items you have ordered are out of stock";
                    }
                    //else if (Model.Amount > Model.product.Quantity)
                    //{
                    //    Model.Amount = Model.product.Quantity;
                    //    ViewBag.hetSanPhamRoi = "The quantity in stock is not enough to supply the Item to you , Item will automatically reduce the quantity in the basket by the quantity in stock";
                    //}
                }
                _appDbContext.SaveChanges();
                var total = item
.Select(c => c.Cart.product.Price * c.Cart.Amount).Sum();
                ViewBag.total = total;

                ViewBag.ProductDetail = item.ToList();

            }
            else
            {
                return RedirectToAction("Login", "UserInfo");
            }

            return View();
        }



        [ValidateAntiForgeryToken]
        [HttpPost]
        public IActionResult CheckOut(Order order, string to, double fee)
        {
            //var clist = _appDbContext.Category.ToList();
            //ViewBag.GetCategory = clist;
            var items = GetShoppingCartItems();
            shoppingCartItems = items;
            if (shoppingCartItems.Count == 0)
            {
                ModelState.AddModelError("", "Your cart is empty");
            }
            else
            {
                foreach (var item in shoppingCartItems)
                {
                    if (item.product.Quantity == 0)
                    {
                        return RedirectToAction("CheckOut");
                    }
                }
            }
            if (ModelState.IsValid)
            {
                order.From = "FPT-Aptech Computer Education HCM, Cách Mạng Tháng Tám, phường 11, Quận 3, Thành phố Hồ Chí Minh";
                order.To = to;
                order.OrderPlaced = DateTime.Now;
                order.Status = "Order not confirm";
                order.Fee = fee;
                _appDbContext.Order.Add(order);
                _appDbContext.SaveChanges();
                //var shoppingCartItemss = shoppingCartItems;
                //var GetOrderID = _appDbContext.Order.SingleOrDefault(m => m.OrderNo.Equals(order.OrderNo));
                var GetAllOrder = (from s in _appDbContext.Order
                                   where s.OrderNo >= 1
                                   orderby s.OrderNo descending
                                   select s).FirstOrDefault();
                var GetORDERID = GetAllOrder.OrderNo;
                int IDPLUS = GetORDERID++;
                string FieldID;
                string ItemListToString = string.Format("{0,8:D8}", IDPLUS);
                if (GetAllOrder == null)
                {
                    FieldID = string.Format("{0,8:D8}", 1);
                }
                else
                {
                    FieldID = ItemListToString;
                }
                var Userid = Convert.ToInt32(HttpContext.Session.GetInt32("id"));
                foreach (var shoppingCartItem in shoppingCartItems)
                {
                    var orderDetail = new OrderDetail()
                    {
                        Amount = shoppingCartItem.Amount,
                        ProductCode = shoppingCartItem.product.ProductCode,
                        OrderNo = order.OrderNo,
                        Price = (shoppingCartItem.product.Price * shoppingCartItem.Amount) + fee,
                        order_number = FieldID,
                        UserID = Userid
                    };
                    _appDbContext.OrderDetails.Add(orderDetail);
                }
                _appDbContext.SaveChanges();
                var shipping = new Shipping()
                {
                    OrderNo = order.OrderNo,
                    Delivered = false,
                    Delivering = false,
                    Delivered_date = DateTime.Now
                };
                _appDbContext.Shipping.Add(shipping);
                _appDbContext.SaveChanges();
                var cartItems = _appDbContext
               .Cart.ToList();
                _appDbContext.Cart.RemoveRange(cartItems);

                _appDbContext.SaveChanges();

                var Mess = HttpContext.Session.GetString("Mess");//get key cart
                if (Mess == null)
                {
                    List<Messenger> Messenger = new List<Messenger>()
               {
                   new Messenger
                   {
                     Amount = 1,
                   }
               };
                    HttpContext.Session.SetString("Mess", JsonConvert.SerializeObject(Messenger));

                }
                else
                {
                    List<Messenger> datamess = JsonConvert.DeserializeObject<List<Messenger>>(Mess);
                    for (int i = 0; i < datamess.Count; i++)
                    {
                        if (datamess[i].Amount == 1)
                        {
                            datamess[i].Amount++;
                        }
                    }
                    HttpContext.Session.SetString("Mess", JsonConvert.SerializeObject(datamess));
                    // var cart2 = HttpContext.Session.GetString("cart");//get key cart
                    //  return Json(cart2);
                }

                ///Them vao shipping DB
                var PaymentCheck = _appDbContext.Order.Where(m => m.OrderNo.Equals(order.OrderNo)).SingleOrDefault();
                if (PaymentCheck.ordertype.Equals("Payment Before Order"))
                {
                    return RedirectToAction("PaymentCreditCard", new { OrderNumber = FieldID });
                }
                return RedirectToAction("ordersucess", new { id = FieldID });

            }
            return View(order);
        }
        /// <summary>
        /// ///////////////////////////////////////
        /// </summary>
        /// <returns></returns>
        /// 
        public IActionResult Error()
        {
            ////ClearOrder();
            var clist = _appDbContext.Category.ToList();
            ViewBag.GetCategory = clist;
            ViewBag.looking = "You are not log in!-Please Log in";
            return View();
        }
        [HttpGet]
        public IActionResult ordersucess(string id, string tranferCode)
        {
            if (HttpContext.Session.GetInt32("id") == null)
            {
                return RedirectToAction("Error", "Order");
            }
            else
            {
                var clist = _appDbContext.Category.ToList();
                ViewBag.GetCategory = clist;
                var li = from p in _appDbContext.Product
                         join Od in _appDbContext.OrderDetails on p.ProductCode equals Od.ProductCode

                         select new Shippingorder
                         {
                             product = p,
                             detail = Od
                         };
                var models = li
                     .Where(h => h.detail.order_number.Equals(id)).ToList();
                foreach (var item in models)
                {
                    if (tranferCode != null)
                    {
                        var Order = _appDbContext.Order.Where(Hivs => Hivs.OrderNo.Equals(item.detail.OrderNo)).ToList();
                        foreach (var item3 in Order)
                        {
                            item3.Status = "Order is confirm";
                            ViewBag.Code = id;
                        };
                    }
                    else
                    {
                        ViewBag.Code = id;
                    }
                }
                _appDbContext.SaveChanges();

                //Nhiệm vụ là kiểm tra cái Truyền từ trang Payment Before để Chuyển status == true


            }

            return View();
        }
    }
}
