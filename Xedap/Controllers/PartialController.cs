using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;

namespace Xedap.Controllers
{
    public class PartialController : Controller
    {
        DataContext Context = new DataContext();
        public ActionResult Category()
        {
            return PartialView(Context.Categories.ToList());
        }
        public ActionResult SubNav()
        {
            return PartialView(Context.Categories.ToList());
        }
    }
}