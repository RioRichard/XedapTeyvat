using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Xedap.Helper;
using Xedap.Models;

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
        //[HttpPost]
        /*public ActionResult SendConfirmMailAgain(string idStaff)
        {
            var Staff = context.AccountStaffs.FirstOrDefault(p => p.IDStaff == idStaff);
            var result = accountStaffRepo.ResendEmail(context, Staff);
            return Json(result);
        }*/
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
        public ActionResult Register(FormCollection collection)
        {

            if (ModelState.IsValid)
            {
                var result = AuthRepo.AddAccount(collection["UserName"], collection["Pass"], collection["Email"]);
                return Json(result);

            }
            else
            {
                var result = new { stringUrl = "/Account/Login", message = "Có lỗi đã xảy ra. Thử lại sau" };
                return Json(result);

            }

        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Log(string UserName,string Pass, bool? rem)
        {
            var Rem = rem ?? false;
            if (ModelState.IsValid)
            {
                var result = AuthRepo.Login(UserName, Pass, Rem);
                return Json(result);

            }
            else
            {
                var result = new { stringUrl = "/Account/Login", message = "Có lỗi đã xảy ra. Thử lại sau" };
                return Json(result);

            }
        }
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
        [AllowAnonymous]
        public ActionResult Login()
        {
            return View();

        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            //if (ModelState.IsValid)
            //{


               
            //    var data = DataContext.Accounts.Where(s => s.Email.Equals(email) && s.Password.Equals(password)).ToList();
            //    if (data.Count() > 0)
            //    {                
            //        Session["IDAccount"] = data.FirstOrDefault().IDAccount;
            //        return RedirectToAction("Index");
            //    }
            //    else
            //    {
            //        ViewBag.error = "Login failed";
            //        return RedirectToAction("Login");
            //    }
            //}
            return View();
        }

        [UserAuthorize]

        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
        
    }
}