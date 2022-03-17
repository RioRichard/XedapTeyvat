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

            ViewBag.DuongPho = Context.            
            return View();
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