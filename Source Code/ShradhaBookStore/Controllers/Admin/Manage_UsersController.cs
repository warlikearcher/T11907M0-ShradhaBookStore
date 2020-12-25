using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ShradhaBookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Controllers.Admin
{
    public class Manage_UsersController : Controller
    {
        private ProjectContext dBContext;
        public Manage_UsersController(ProjectContext dBContext)
        {
            this.dBContext = dBContext;
        }
        public IActionResult Manage_Users()
        {
            var model = dBContext.UserInfo.Where(p => p.IsAdmin == false).ToList();
            ViewBag.user = model;
            return View("~/Views/Admin/Manage_Users/Manage_Users.cshtml", model);

        }

        public IActionResult deactiveUser(int id)
        {
            try
            {
                UserInfo user = dBContext.UserInfo.SingleOrDefault(u => u.UserID.Equals(id));
                if (user != null)
                {
                    if (user.Status == true)
                    {
                        user.Status = false;
                    }
                    else
                    {
                        user.Status = true;
                    }
                    dBContext.SaveChanges();
                    return RedirectToAction("Manage_Users");
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", e.Message);
            }
            return View();
        }
        public IActionResult Filter(string bname)
        {
            //var model = dBContext.UserInfo.Where(p => p.IsAdmin == false).ToList();
            var model = from m in dBContext.UserInfo
                        where m.IsAdmin==false
                        select m;
            if (!string.IsNullOrEmpty(bname))
            {
             
                model = model.Where(m => m.FullName.Contains(bname));
            }
            return View("~/Views/Admin/Manage_Users/Manage_Users.cshtml", model);
        }
    }
}

