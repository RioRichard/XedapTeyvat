using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;
using Xedap.Models.Repo;
using CartRepo = Xedap.Models.Repo.CartRepo;

namespace Xedap.Controllers
{
    [RoutePrefix("admin")]
    public class AdminController : BaseController
    {
        DataContext context = new DataContext();

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
        public ActionResult Chart()
        {
            
            return View();
        }
        
        public ActionResult DashboardBar()
        {

            var Accounts = InvoiceRepo.TotalBuyFolowUser(context);
            var result = Accounts.OrderByDescending(p => p.TotalBought).Select(p => new { p.UserName, p.TotalBought });
            return Json(result);
        }
        public ActionResult DashboardPie()
        {
            var result = CartRepo.GetTotalFollowProduct(context);
            return Json(result);
        }
        
        
    }
}