using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;

namespace Xedap.Controllers
{
    [RoutePrefix("admin")]
    public class AdminController : BaseController
    {
        
        
        // GET: Admin
        public ActionResult Index()
        {
            return View();
        }


        [Route("Product/{page?}")]

        public ActionResult Product(int? page)
        {
            ViewBag.page = (page ?? 1);
            var search = string.Empty;
            int count = 0;
            var result = ProductRepo.GetProducts(out count, (page ?? 1), search);
            ViewBag.count = count / 10;
            return View(result);
            //return View(DataContext.Products);
        }
    }
}