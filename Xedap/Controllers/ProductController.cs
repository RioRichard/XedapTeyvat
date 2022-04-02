using System.Linq;
using System.Web.Mvc;
using Xedap.Models;
using Xedap.Models.Repo;

namespace Xedap.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult ProductDetail(int? id )
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