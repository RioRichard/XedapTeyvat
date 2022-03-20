using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;

namespace Xedap.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult ProductDetail(int? id = 10)
        {
            DataContext context = new DataContext();
            ViewBag.PA = ProductRepo.GetAttribute(context, id);
            if (id == null)
            {
                return View("~/Views/Product/Cantfound404");
            }
            return View(context.Products.FirstOrDefault(p => p.IDProduct == id));
        }
        public ActionResult Cantfound404()
        {
            return View();
        }
    }
}