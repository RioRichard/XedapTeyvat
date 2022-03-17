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
            //4 = Phu Nu
            ViewBag.DuongPho = Context.Products.Where(p => p.Category.IDCategory == 1).Take(4);
            ViewBag.Dua = Context.Products.Where(p => p.Category.IDCategory == 2).Take(4);
            return View(Context.Products.Where(p=>p.Category.IDCategory == 4).Take(4));
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