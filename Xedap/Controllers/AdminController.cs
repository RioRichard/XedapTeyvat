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
        IConfiguration configuration;
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
        public ActionResult Test()
        {
            configuration["ImageUrlLogo"] = "logo-TGCF-224.png";
            return Json(configuration["ImageUrlLogo"]);
        }

        public ActionResult Attribute()
        {
            ViewBag.Attributes = context.Attributes.ToList();
            return View(context.Attributes.Where(p => p.IsDelete == false));
        }
        
        public ActionResult EditAttribute(int id)
        {
            var Attribute = context.Attributes.Select(p => p).Where(p => p.IDAttribute == id).FirstOrDefault();
            return View(Attribute);
        }
        [HttpPost]
        public ActionResult EditAttribute(Models.Attribute edited)
        {
            try
            {
                var udm = context.Attributes.Select(p => p).Where(p => p.IDAttribute == edited.IDAttribute).FirstOrDefault();
                udm.AttributeName = edited.AttributeName;
                var id = context.SaveChanges();
                return RedirectToAction("Attribute");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult AddAtribute()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddAtribute(Models.Attribute att)
        {

            att.IsDelete = false;
            context.Attributes.Add(att);
            context.SaveChanges();
            if (att.IDAttribute > 0)
            {
                return RedirectToAction("Attribute");
            }
            else
            {
                ModelState.AddModelError("", "Khong luu duoc");
                return View();
            }
        }

        public ActionResult DeletedAttribute()
        {

            return View(context.Attributes.Where(p => p.IsDelete == true));
        }
        [HttpPost]
        [HttpGet]
        public ActionResult DeletedAttribute(int id)
        {
            try
            {
                var md = context.Attributes.FirstOrDefault(p => p.IDAttribute == id);
                md.IsDelete = true;
                context.SaveChanges();
                return RedirectToAction("Attribute");
            }
            catch(Exception e)
            {
                 Console.WriteLine(e.Message);
                return View();
            }
            
        }
        
        public ActionResult DeletedAttributeVV(int id)
        {
            var md = context.Attributes.Find(id);
            context.Attributes.Remove(md);
            context.SaveChanges();
            return RedirectToAction("DeletedAttribute");
        }
        public ActionResult RestoreAttribute(int id)
        {

            var md = context.Attributes.Find(id);
            md.IsDelete = false;
            context.SaveChanges();
            return RedirectToAction("DeletedAttribute");
        }
    }
}