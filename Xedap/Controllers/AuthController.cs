using System;
using System.Linq;
using System.Web.Mvc;
using Xedap.Models;
using Xedap.Helper;
using Xedap.Models.Repo;
using System.Web.Security;

namespace Xedap.Controllers
{
    public class AuthController : BaseController
    {
        // GET: CustomerAuth
        public ActionResult SignAndReg()
        {
            return View();
        }
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
        public ActionResult Log(string UserName, string Pass, bool? rem)
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

            var account = Context.Accounts.FirstOrDefault(p => p.Token == id);
            if (account == null)
            {
                ViewBag.rs = "Không tồn tại tài khoản. Vui lòng thử lại.";

                return View();
            }
            if (account != null)
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
        [HttpPost]
        public ActionResult ForgotPassword(string input)
        {
            return View();
            

        }
    }
}