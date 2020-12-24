using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

using ShradhaBookStore.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using System.IO;
using X.PagedList;
using X.PagedList.Mvc;

namespace ShradhaBookStore.Controllers
{
    public class BannerController : Controller
    {
        private ProjectContext context;
        public BannerController(ProjectContext context)
        {
            this.context = context;
        }
        public IActionResult Banner_list(int? page)
        {
            var listBanner = context.Banner.ToList();
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            ViewBag.listBanner = listBanner.ToPagedList(pageNumber, pageSize);
            return View("~/Views/Admin/Banner/Banner_list.cshtml");
        }
        public IActionResult Add_Banner()
        {
            return View("~/Views/Admin/Banner/Add_Banner.cshtml");
        }
        [HttpPost]
        public IActionResult Add_Banner(IFormFile file, Banner banner)
        {
                if (file.Length > 0)
                {
                    var filePath = Path.Combine("wwwroot/Image/", file.FileName);
                    var stream = new FileStream(filePath, FileMode.Create);
                    file.CopyToAsync(stream);
                    banner.Image = file.FileName;
                        banner.CreateAt = DateTime.Now;
                        context.Banner.Add(banner);
                        context.SaveChanges();
                        TempData["msg"] = "<script>alert('Add Banner succesfully');</script>";
                        return RedirectToAction("Banner_list", "Banner");

                }
                else
                {
                    TempData["msg"] = "<script>alert('Please import image');</script>";
                    return View("~/Views/Admin/Banner/Add_Banner.cshtml");
                }

                
        }



        [HttpPost]
        public IActionResult Remove_Banner(string bannerCode)
        {
            var itemFind = context.Banner.FirstOrDefault(p => p.BannerCode.Equals(bannerCode));
            if (itemFind != null)
            {
                context.Banner.Remove(itemFind);
                context.SaveChanges();
                return RedirectToAction("Banner_list", "Banner");
            }
            else
            {
                TempData["msg"] = "<script>alert('Banner not found!!');</script>";
                return RedirectToAction("Banner_list", "Banner");
            }

        }
    }
}
