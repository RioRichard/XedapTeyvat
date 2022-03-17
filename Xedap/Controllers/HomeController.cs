using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;

namespace Xedap.Controllers
{
    public class HomeController : Controller
    {
        DataContext Context = new DataContext();
        public ActionResult Index()
        {
            //1 = Duong Pho
            //2 = Dua
            //6 = Tre em
            ViewBag.DuongPho = Context.Products.Where(p => p.Category.IDCategory == 1).Take(4);
            ViewBag.Dua = Context.Products.Where(p => p.Category.IDCategory == 2).Take(4);
            return View(Context.Products.Where(p=>p.Category.IDCategory == 6).Take(4));
        }
        [ChildActionOnly]
        public ActionResult Category()
        {
            return PartialView(Context.Categories.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}