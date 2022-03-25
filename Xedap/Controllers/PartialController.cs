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
       
        public ActionResult Category()
        {
            return PartialView(DataContext.Categories.ToList());
        }
        public ActionResult SubNav()
        {
            return PartialView(DataContext.Categories.ToList());
        }
        public ActionResult getProductForm(int id)
        {
            var result = ProductRepo.GetProductForm(DataContext, id);
            ViewBag.Categories = DataContext.Categories.ToList();
            ViewBag.ValueAttributes = ProductRepo.GetAttribute(DataContext, id);
            ViewBag.ValueCategories = DataContext.Products.FirstOrDefault(p => p.IDProduct == id);
            ViewBag.Attributes = DataContext.Attributes.ToList();
            return PartialView(result);
             
        }
    }
}