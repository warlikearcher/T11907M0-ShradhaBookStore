using ShradhaBookStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShradhaBookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace ShradhaBookStore.Controllers
{
    public class UserInfoController : Controller
    {
        private readonly ProjectContext context;
        //private readonly SaveShoppingCartID save;
        public UserInfoController(ProjectContext context)
        {
            this.context = context;
        }
        public ActionResult Index()
        {
           
           
            return View();
        }


        [HttpGet]

        public IActionResult Details(int id)

        {
            if (HttpContext.Session.GetInt32("id") != null)
            {
                var result = context.UserInfo.Find(id);

                if (result != null)
                {
                    return View(result);
                }

                return RedirectToAction("Index", "Home");
            }
            else
            {

                return View("Login", "UserInfo");
            }
        }
        public ActionResult Register()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(UserInfo userInfo)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var check = context.UserInfo.SingleOrDefault(s => s.UserName.Equals(userInfo.UserName));
                    if (check == null)
                    {
                        context.UserInfo.Add(userInfo);
                        context.SaveChanges();
                        TempData["msg"] = "<script>alert('Register succesfully');</script>";
                        return RedirectToAction("Login", "UserInfo");
                    }
                    else
                    {
                        ViewBag.error = "User Name already exists";

                    }
                   
                }
                else
                {
                    ViewBag.erro = "The fields not blank";
                }


            }
            catch (Exception ex)
            {
                ViewBag.error = ex.Message;
            }
            return View();
        }
          
        
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(UserInfo userInfo)
        {
            try
            {
                UserInfo user = context.UserInfo.SingleOrDefault(a => a.UserName.Equals(userInfo.UserName));
                if (user != null)
                   
                {
                    if (user.Status == true) 
                    {
                        if (user.PassWord.Equals(userInfo.PassWord))

                        {

                            if (user.IsAdmin == true)
                            {
                                HttpContext.Session.SetInt32("adid", user.UserID);
                                HttpContext.Session.SetString("adfullname", user.FullName);
                                HttpContext.Session.SetString("adusername", user.UserName);

                                return RedirectToAction("Manage_Admin", "Manage_Admin");

                            }
                            else
                            {

                                string fname = HttpContext.Session.GetString("fullname");
                                string check = HttpContext.Session.GetString("cart");
                                HttpContext.Session.SetString("fullname", user.FullName);
                                HttpContext.Session.SetInt32("id", user.UserID);
                                HttpContext.Session.SetString("username", user.UserName);
                                HttpContext.Session.SetString("mail", user.Email);
                                if (check != null)
                                {

                                    return RedirectToAction("UpdateToDatabase", "Cart2");
                                }

                                TempData["msg"] = "<script>alert('Login succesfully');</script>";
                                return RedirectToAction("Index", "Home");
                            }
                        }
                        else
                        {
                            ViewBag.Msg = "Invalid Password";
                        }
                    }
                    else
                    {
                        ViewBag.Msg = "This account has been locked";
                    }
              
                }
                else
                {
                    ViewBag.Msg = "User not found ...";
                }
            }
            catch (Exception ex)
            {
                ViewBag.Msg = ex.Message;
            }
            return View();
        
    }

        public IActionResult Update(int id)
        {
            var reup = context.UserInfo.Find(id);
            if (reup == null)
            {
                return BadRequest();
            }

            return View(reup);
        }

        [HttpPost]
        public IActionResult Update(string fullname, string email, string phone, string adress, int id)
        {

            UserInfo comp = context.UserInfo.SingleOrDefault(c => c.UserID.Equals(id));

            comp.FullName = fullname;
            comp.Email = email;
            comp.Phone = phone;
            comp.Adress = adress;
            context.SaveChanges();
            return RedirectToAction("Details", "UserInfo");

        }
        public IActionResult ChangePass()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ChangePass(UserInfo userInfo, string npass, string confnpass, int id)
        {

            try
            {
                var model = context.UserInfo.SingleOrDefault(s => s.UserID.Equals(id));
                //check if model != null
                if (model != null)
                {

                    //check newpassword and confirm not null
                    if (npass == null || confnpass == null || userInfo.PassWord == null)
                    {
                        if (npass == null)
                        {
                            ViewBag.nPass = "New Password Cannot  blank";
                        }
                        if (confnpass == null)
                        {
                            ViewBag.cnPass = "Confirm Pass Cannot blank";
                        }
                        if (userInfo.PassWord == null)
                        {
                            ViewBag.nPass = "Password Cannot blank";
                        }
                        return View();
                    }
                    else
                    {
                        if (userInfo.PassWord != npass)
                        {

                            if (npass.Length <= 49 && npass.Length >= 5)
                            {
                                if (npass != confnpass) //check confirm
                                {
                                    ViewBag.cnPass = "Confirm Password and Password must match";
                                }
                                else
                                {

                                    model.PassWord = npass;
                                    context.SaveChanges();
                                    ViewBag.Msg = "Update Password Success";
                                    return RedirectToAction("Login", "UserInfo");
                                }
                            }
                            else
                            {
                                ViewBag.nPass = "Password must be from 5 to 49 characters";
                            }

                        }
                        else
                        {
                            ViewBag.Msg = "Current password incorrect";
                        }
                    }
                }
                else
                {
                    ViewBag.Msg = "Failed";
                }
            }
            catch (Exception ex)
            {
                ViewBag.Msg = ex.Message;
            }
            return View();
        }
        public IActionResult LogOut()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }


    }


}
