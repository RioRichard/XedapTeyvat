using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Xedap.Helper;
using Xedap.Models;
using Xedap.Models.Repo;

namespace Xedap.Controllers
{

    public class AccountController : BaseController
    {
        
        // GET: Account
        
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }
    
        public ActionResult ForgotPassword()
        {
            return View();
        }
        public ActionResult ResetPassword()
        {
            return View();
        }
        public ActionResult EmailConfirmCompleted()
        {
            return View();
        }

        public ActionResult SendMailAgain()
        {
            return View();
        }


        
        //public ActionResult Register(string UserName, string Pass, string Email)
        //{
        //    var result = AuthRepo.AddAccount(UserName, Pass, Email);
        //    return Json(result);

        //}

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
       
        public ActionResult Address()
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            //var result = AddressRepo.GetAddressByUser(Context, userId);

            return View(Context.AccountAddresses.Where(p=>p.IDAccount==userId).ToList());
        }
        public ActionResult ChangePassword()
        {
            return View();
        }

        //create a string MD5
       
        public ActionResult Cart()
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            var result = CartRepo.GetAllCartItem(Context, userId);
            var address= Context.AccountAddresses.Where(p => p.IDAccount == userId).ToList();
            ViewBag.Address = address;
            ViewBag.AddressCount = address.Count;

            if (result == null)
            {
                var fakeList = new List<ProductCart>();
                return View(fakeList);

            }
            return View(result);
        }
        public ActionResult Invoice()
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            var result = InvoiceRepo.GetInvoices(Context, userId);
            return View(result);
        }


       
        
        
    }
}