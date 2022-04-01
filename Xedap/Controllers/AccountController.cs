using System;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Xedap.Helper;

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
            return View(Context.Addresses);
        }
        public ActionResult ChangePassword()
        {
            return View();
        }

        //create a string MD5
       
        public ActionResult Cart()
        {
            //var address = AddressRepo.GetAddressByUser(context, userId);
            //ViewBag.Address = address;
            //ViewBag.AddressCount = address.Count;
            return View(Context.Carts);
        }
        public ActionResult Invoice()
        {
            return View(Context.Invoices);
        }


       
        
        
    }
}