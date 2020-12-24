using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShradhaBookStore.Models;
using Microsoft.EntityFrameworkCore;
namespace ShradhaBookStore.Controllers
{
    public class Cart2Controller : Controller
    {
        private readonly ProjectContext context;
        ////private readonly SaveShoppingCartID save;
        public Cart2Controller(ProjectContext context)
        {
            this.context = context;
        }
        public List<Cart> shoppingCartItems { get; set; }

        public List<Cart> GetShoppingCartItems()
        {
            return shoppingCartItems ??
                (shoppingCartItems =
                       context.Cart
                           .Include(s => s.product)
                           .ToList());
        }
        //Nee id session null thi  list session cart 
        // neu session id khac null thi list id
        public IActionResult Index(string check)
        {
            var clist = context.Category.ToList();
            ViewBag.GetCategory = clist;
            ViewBag.Randomurl = RandomString(30);
            if (HttpContext.Session.GetInt32("id") == null)
            {
                var cart = HttpContext.Session.GetString("cart");//get key cart
                if (cart != null)
                {
                    List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                    foreach (var item in dataCart)
                    {
                        var GetQuantty = context.Product.Where(prop => prop.ProductCode.Equals(item.product.ProductCode)).ToList();
                        ViewBag.Quanttiy = GetQuantty;
                    }
                    if (dataCart.Count == 0)
                    {
                        HttpContext.Session.Remove("cart");
                    }
                    else
                    {
                        var total = dataCart
                  .Select(c => c.product.Price * c.Amount).Sum();
                        //    var name = dataCart
                        //.Select(c => c.product.ProductName).ToString();
                        //ViewBag.ProductName = name;
                        ViewBag.total = total;
                    }
                    if (check != null)
                    {
                        ViewBag.HetSanPham = "Sản phẩm bạn của bạn muốn mua hiện tại đã bị đôremon mang đi rồi";
                    }
                    else
                    {
                        ViewBag.GetItem = dataCart;
                    }
                }
            }
            else
            {
                var item = from s in context.Cart
                           join i in context.Product
                           on s.product.ProductCode equals i.ProductCode
                           where s.UserId == HttpContext.Session.GetInt32("id")
                           select new OrderProduct
                           {
                               Cart = s,
                               product = i
                           };
                var model = (from i in item
                             select i).ToList();

                if (model.Count == 0)
                {
                    ViewBag.GetItem = null;
                }
                else
                {
                    var tem = GetShoppingCartItems();
                    shoppingCartItems = tem;
                    foreach (var Model in shoppingCartItems)
                    {
                        if (Model.product.Quantity == 0)
                        {
                            context.Cart.Remove(Model);
                            ViewBag.Check = "tRes";
                        }
                    }

                    context.SaveChanges();
                    var total = item
             .Select(c => c.Cart.product.Price * c.Cart.Amount).Sum();
                    ViewBag.total = total;
                    if (check != null)
                    {
                        ViewBag.HetSanPham = "Sản phẩm bạn của bạn muốn mua hiện tại đã bị đôremon mang đi rồi";
                    }
                    else
                    {
                        ViewBag.GetItem = model;
                    }
                }
            }
            return View();
        }

        public RedirectToActionResult RemoveAll(string id)
        {
            string a = HttpContext.Session.GetInt32("id").ToString();
            var cart = HttpContext.Session.GetString("cart");
            if (cart != null)
            {
                List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                var kiemtra = dataCart.Where(p => p.product.ProductCode == id).SingleOrDefault();
                if (dataCart.Count == 0)
                {
                    HttpContext.Session.Remove("cart");
                }
                else
                {
                    if (kiemtra != null)
                    {
                        dataCart.Remove(kiemtra);
                    }
                    HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(dataCart));
                }
            }

            else if (a != null)
            {
                var item = from s in context.Cart
                           join i in context.Product
                           on s.product.ProductCode equals i.ProductCode
                           select new OrderProduct
                           {
                               Cart = s,
                               product = i
                           };
                var selectedProduct = item.FirstOrDefault(p => p.product.ProductCode.Equals(id));
                if (selectedProduct != null)
                {
                    var shoppingCartItem =
                     item.SingleOrDefault(
                         s => s.Cart.product.ProductCode == selectedProduct.product.ProductCode);

                    if (item == null)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        if (shoppingCartItem != null)
                        {
                            context.Cart.Remove(shoppingCartItem.Cart);
                        }
                        context.SaveChanges();
                    }
                }
            }
            else
            {
                ViewBag.Empty = "Your Cart is empty";
            }
            return RedirectToAction("Index");
        }

        private static Random random = new Random();

        //public string GetImage { get; private set; /*/*/*/*}*/*/*/*/

        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        public RedirectToActionResult UpdateToDatabase()
        {
            int? ints = Convert.ToInt32(HttpContext.Session.GetInt32("id"));
            int userId = Convert.ToInt32(HttpContext.Session.GetInt32("id"));
            var cart = HttpContext.Session.GetString("cart");//get key cart
            if (ints != null)
            {
                if (cart != null)
                {
                    List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                    //dataCart.Where(s=>s.)
                    foreach (var item in dataCart)
                    {
                        var Cartss = context.Cart.SingleOrDefault(m => m.product.Equals(item.product));
                        var GetProduct = context.Product.SingleOrDefault(m => m.ProductCode.Equals(item.product.ProductCode));
                        if (Cartss == null)
                        {
                            Cartss = new Cart
                            {
                                product = GetProduct,
                                Amount = item.Amount,
                                UserId = userId,
                                Price = GetProduct.Price,
                                Picture = GetProduct.Picture
                            };
                            context.Cart.Add(Cartss);
                        }
                        else
                        {
                            Cartss.Amount += item.Amount;
                        }

                    };
                    context.SaveChanges();
                    HttpContext.Session.Remove("cart");
                    return RedirectToAction("Index", "Cart2");

                }
                else
                {
                    HttpContext.Session.Remove("cart");
                    return RedirectToAction("Index", "Cart2", new { check = "1f3870be274f6c49b3e31a0c6728957f" });
                }
            }
            else
            {
                return RedirectToAction("Login", "UserInfo");
            }

        }

        public RedirectToActionResult AddToShoppingCart(string id)
        {
            if (id == null)
            {
                return RedirectToAction("Error", "Order");
            }
            var CheckProduct = context.Product.Where(s => s.ProductCode.Equals(id));
            if (CheckProduct == null)
            {
                return RedirectToAction("Error", "Order");
            }
            if (HttpContext.Session.GetInt32("id") != null)
            {
                var Find = context.Cart.Where(m => m.product.ProductCode.Equals(id)).FirstOrDefault();
                var x = int.Parse(HttpContext.Session.GetInt32("id").ToString());
                var GetProduct = context.Product.SingleOrDefault(m => m.ProductCode.Equals(id));
                if (Find == null)
                {
                    if (Find == null)
                    {
                        //int x = int.Parse(HttpContext.Session.GetInt32("id").ToString());
                        Find = new Cart
                        {
                            product = GetProduct,
                            UserId = x,
                            Amount = 1,
                            Price = GetProduct.Price,
                            Picture = GetProduct.Picture
                        };
                        context.Cart.Add(Find);
                    }
                }
                else
                {
                    Find.Amount++;
                }
                context.SaveChanges();
                return RedirectToAction("Index", "Home");
            }
            else
            {
                var cart = HttpContext.Session.GetString("cart");//get key cart
                if (cart == null)
                {
                    var product = context.Product.SingleOrDefault(m => m.ProductCode.Equals(id));
                    List<Cart> listCart = new List<Cart>()
               {
                   new Cart
                   {
                       product = product,
                       Amount = 1,
                       UserId = 0,
                       Price = product.Price,
                       Picture = product.Picture
                   }
               };
                    HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(listCart));

                }
                else
                {
                    List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                    bool check = true;
                    for (int i = 0; i < dataCart.Count; i++)
                    {
                        if (dataCart[i].product.ProductCode == id)
                        {
                            dataCart[i].Amount++;
                            check = false;
                        }
                    }
                    if (check)
                    {
                        var product = context.Product.SingleOrDefault(m => m.ProductCode.Equals(id));
                        dataCart.Add(new Cart
                        {
                            product = product,
                            Amount = 1,
                            UserId = 0,
                            Price = product.Price,
                            Picture = product.Picture
                        });
                    }
                    HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(dataCart));
                    // var cart2 = HttpContext.Session.GetString("cart");//get key cart
                    //  return Json(cart2);
                }

                return RedirectToAction(nameof(Index), "Home");

            }

        }






        [HttpPost]
        public IActionResult updateAll(string id, int quantity)
        {
            var cart = HttpContext.Session.GetString("cart");
            if (cart != null)
            {
                List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                if (quantity > 0)
                {
                    var GetQuantity = context.Product.SingleOrDefault(m => m.ProductCode.Equals(id));
                    for (int i = 0; i < dataCart.Count; i++)
                    {
                        if (dataCart[i].product.ProductCode == id)
                        {
                            dataCart[i].Amount = quantity;
                        }
                    }


                    HttpContext.Session.SetString("cart", JsonConvert.SerializeObject(dataCart));
                }
                var cart2 = HttpContext.Session.GetString("cart");
                return Ok(quantity);
            }
            else if (HttpContext.Session.GetInt32("id") != null)
            {
                var ListItem = (from s in context.Cart
                                join i in context.Product
                                on s.product.ProductCode equals i.ProductCode
                                select new OrderProduct
                                {
                                    Cart = s,
                                    product = i
                                }).ToList();
                if (quantity > 0)
                {
                    for (int i = 0; i < ListItem.Count; i++)
                    {
                        if (ListItem[i].product.ProductCode == id)
                        {
                            ListItem[i].Cart.Amount = quantity;
                        }
                    }
                    context.SaveChanges();
                }

                return Ok(quantity);
            }
            return BadRequest();

        }

        public IActionResult Total()
        {
            var cart = HttpContext.Session.GetString("cart");
            var item = GetShoppingCartItems();
            double Totalss = 0;
            double total;
            if (HttpContext.Session.GetInt32("id") != null)
            {
                if (item != null)
                {
                    total = item
.Select(c => c.product.Price * c.Amount).Sum();
                    Totalss = total;

                }
                else
                {
                    Totalss = 0;
                }
            }
            else
            {
                if (cart != null)
                {
                    List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                    if (dataCart != null)
                    {
                        total = dataCart
.Select(c => c.product.Price * c.Amount).Sum();
                        Totalss = total;
                    }
                    else
                    {
                        Totalss = 0;
                    }
                }
            }
            ViewBag.Total = Totalss;

            return PartialView();
        }




        public IActionResult _Count()
        {
            var cart = HttpContext.Session.GetString("cart");
            var item = GetShoppingCartItems();
            int Count = 0;
            if (HttpContext.Session.GetInt32("id") != null)
            {
                if (item != null)
                {
                    Count = item.Count();
                }
                else
                {
                    Count = 0;
                }
            }
            else
            {
                if (cart != null)
                {
                    List<Cart> dataCart = JsonConvert.DeserializeObject<List<Cart>>(cart);
                    if (dataCart != null)
                    {
                        Count = dataCart.Count();
                    }
                    else
                    {
                        Count = 0;
                    }
                }
            }
            ViewBag.Count = Count;
            return PartialView();
        }






        public RedirectToActionResult ClearCart()
        {

            var cartItems = context.Cart.ToList();
            context.Cart.RemoveRange(cartItems);
            context.SaveChanges();
            return RedirectToAction("Index", "Cart2");
        }
    }
}
