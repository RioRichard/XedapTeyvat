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
            ViewBag.Message = "Your application description page." ;

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}