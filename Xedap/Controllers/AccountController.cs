using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            var userId = System.Web.HttpContext.Current.User.Identity.Name;

            var result = CartRepo.GetAllCartItem(Context, userId);
            var address = AddressRepo.GetAddressByUser(Context, userId);

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

        

        //Logout
        public ActionResult Logout()
        {
            if (!HttpContext.User.Identity.IsAuthenticated)
            {
                return Redirect("/Account/Login");

            }
            FormsAuthentication.SignOut();
            return Redirect("/");
        }

        public ActionResult Confirm(string id)
        {
            
            var account  = Context.Accounts.FirstOrDefault(p=>p.Token == id);
            if (account == null)
            {
                ViewBag.rs = "Không tồn tại tài khoản. Vui lòng thử lại.";
                
                return View();
            }
            if(account != null)
            {
                if (DateTime.Compare(((DateTime)account.ExpiredTokenTime).AddMinutes(15), DateTime.Now) < 0)
                {
                    account.Token = HelperAdd.GenerateToken(account.IDAccount);
                    account.ExpiredTokenTime = DateTime.Now.AddMinutes(15);
                    Context.SaveChanges();
                    var msg = "Chào bạn, đây là email của hỗ trợ Teyvat. Đây là email xác thực của XeDapTeyVat. Hãy nhấn vào đường link sau để có thể xác thực tài khoản.\n" +
                        $"{HelperAdd.WebsiteUrl}/account/confirm/{account.Token}";
                    var subject = "Kích hoạt tài khoản XeDapTeyVat";
                    HelperAdd.SendMail(account.Email, msg, subject);
                    ViewBag.rs = "Token đã hết hạn, vui lòng xác nhận lại";
                    return View();
                }
            }
            account.IsConfirmed = true;
            account.Token = String.Empty;
            Context.SaveChanges();
            ViewBag.rs = "Xác nhận thành công";
            return View();

        }
        
        
    }
}