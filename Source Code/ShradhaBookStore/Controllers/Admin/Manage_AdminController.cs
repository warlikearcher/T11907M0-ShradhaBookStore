using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShradhaBookStore.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;

namespace ShradhaBookStore.Controllers.Admin
{
	public class Manage_AdminController : Controller
	{
		private readonly ProjectContext context;
		public Manage_AdminController(ProjectContext context)
		{
			this.context = context;
		}
		public IActionResult Manage_Admin()
		{
			var linq = from a in context.Product
					   join i in context.Category
					   on a.CategoryCode equals i.CategoryCode
					   group new { a, a.CategoryCode } by new
					   {
						   a.CategoryCode,
						   Column1 = a.CategoryCode
					   } into g
					   select new
					   {
						   g.Key.CategoryCode,
						   cout = g.Count()
					   };
			//ViewBag.Cout = linq.ToList();
			List<DataPoint2> dataPoints2 = new List<DataPoint2>();
			foreach (var item in linq)
			{
				dataPoints2.Add(new DataPoint2(item.CategoryCode, item.cout));
				ViewBag.DataPoints = JsonConvert.SerializeObject(dataPoints2);
			}



			var linqqq = from OrderDetails in context.OrderDetails
						 join Order in context.Order
						 on OrderDetails.OrderNo equals Order.OrderNo
						 where Order.Status == "Order is confirm"
						 group new { Order.OrderPlaced, OrderDetails } by new
						 {
							 Column1 = (int?)Order.OrderPlaced.Year,
							 Column2 = (int?)Order.OrderPlaced.Month
						 } into g
						 orderby
						   g.Key.Column1,
						   g.Key.Column2
						 select new
						 {
							 Year = g.Key.Column1,
							 Month = g.Key.Column2,
							 TotalAmount = (int)g.Sum(p => p.OrderDetails.Price)
						 };



			List<DataPoint> dataPoints = new List<DataPoint>();


			foreach (var item in linqqq)
			{
				dataPoints.Add(new DataPoint(item.Year, item.TotalAmount));
				ViewBag.DataPoints2 = JsonConvert.SerializeObject(dataPoints);
			}


			var table = context.Category.ToList();
			if (table != null)
			{
				ViewBag.Table = table;
			}


			return View("~/Views/Admin/Manage_Admin/Manage_Admin.cshtml");
		}

		//public IActionResult ManagaA_Chart()
		//{

		//	return View("~/Views/Admin/Manage_Admin/ManagaA_Chart.cshtml");
		//}
		public IActionResult LogOut()
		{
			HttpContext.Session.Remove("adid");
			return RedirectToAction("Index", "Home");
		}

	}
}
