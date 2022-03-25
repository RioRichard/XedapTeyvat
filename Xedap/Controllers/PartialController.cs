using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;
using Xedap.Models.Repo;

namespace Xedap.Controllers
{
    public class PartialController : BaseController
    {
        DataContext context = new DataContext();
        public ActionResult Category()
        {
            return PartialView(context.Categories.ToList());
        }
        public ActionResult SubNav()
        {
            return PartialView(context.Categories.ToList());
        }
        public ActionResult getProductForm(int id)
        {
            var result = ProductRepo.GetProductForm(context, id);
            ViewBag.Categories = context.Categories.ToList();
            ViewBag.ValueAttributes = ProductRepo.GetAttribute(context, id);
            ViewBag.ValueCategories = context.Products.FirstOrDefault(p => p.IDProduct == id);
            ViewBag.Attributes = context.Attributes.ToList();
            return PartialView(result);
             
        }
    }
}