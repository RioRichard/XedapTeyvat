using System.Linq;
using System.Web.Mvc;
using Xedap.Models;

namespace Xedap.Controllers
{
    public class HomeController : Controller
    {
        DataContext context = new DataContext();
        public ActionResult Index()
        {
            //1 = Duong Pho
            //2 = Dua
            //6 = Tre em
            ViewBag.DuongPho = context.Products.Where(p => p.Category.IDCategory == 1 && p.IsDelete == false).Take(4);
            ViewBag.Dua = context.Products.Where(p => p.Category.IDCategory == 2 && p.IsDelete == false).Take(4);
            return View(context.Products.Where(p=>p.Category.IDCategory == 6 && p.IsDelete == false).Take(4));
        }
        [ChildActionOnly]
        public ActionResult Category()
        {
            return PartialView(context.Categories.ToList());
        }

        public ActionResult About()
        {
            

            return View();
        }

        public ActionResult Contact()
        {
            

            return View();
        }
        public ActionResult PolicyRefund()
        {
            return View();
        }

        public ActionResult PolicySecurity()
        {
            return View();
        }

        public ActionResult OurPolicy()
        {
            return View();
        }
    }
}