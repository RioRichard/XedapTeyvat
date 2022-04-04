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
                var result = new { stringUrl = "/auth/SignAndReg", message = "Có lỗi đã xảy ra. Thử lại sau" };
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
                var result = new { stringUrl = "/Auth/SignAndReg", message = "Có lỗi đã xảy ra. Thử lại sau" };
                return Json(result);

            }
        }
        [Authorize]
        public ActionResult Logout()
        {
            if (!User.Identity.IsAuthenticated)
            {
                return Redirect("/Auth/SignAndReg");

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
                        $"{HelperAdd.WebsiteUrl}/auth/confirm/{account.Token}";
                    var subject = "Lấy lại tài khoản XeDapTeyVat";
                    HelperAdd.SendMail(account.Email, msg, subject);
                    ViewBag.rs = "Token đã hết hạn, vui lòng xác nhận lại";
                    return View();
                }
            }
            account.IsConfirmed = true;
            account.Token = String.Empty;
            account.ExpiredTokenTime = DateTime.MinValue;
            Context.SaveChanges();
            ViewBag.rs = "Xác nhận thành công";
            return View();

        }

        public ActionResult ForgotPassword(string input)
        {
            return View();
        }
        [HttpPost]
        public JsonResult Forgot(string email)
        {
            var account = Context.Accounts.FirstOrDefault(p => p.Email == email);
            if (account == null)
            {
                return Json(new { msg = "Không có tài khoản có email tương ứng", url = "null" });
            }
            else
            {
                if ((DateTime)account.ExpiredTokenTime < DateTime.Now)
                {
                    account.Token = HelperAdd.GenerateToken(account.IDAccount);
                    account.ExpiredTokenTime = DateTime.Now.AddMinutes(15);
                    Context.SaveChanges();
                    var msg = "Chào bạn, đây là email của hỗ trợ Teyvat. Đây là email lấy lại mật khẩu của XeDapTeyVat." +
                        "Hãy nhấn vào đường dẫn dưới để có thể xác thực tài khoản.\n" +
                        $"{HelperAdd.WebsiteUrl}/auth/reset/{account.Token}";
                    var subject = "Lấy lại mật khẩu XeDapTeyVat";
                    HelperAdd.SendMail(account.Email, msg, subject);
                    
                    return Json(new { msg = "Email lấy lại mật khẩu đã được gửi đến email của bạn", url = "/Auth/SignAndReg" });
                }
                return Json(new { msg = "Bạn vừa đăng ký hoặc vừa gửi yêu cầu lấy lại mật khẩu. Hãy thử lại sau 15 phút", url = "null" });

            }


        }
        [HttpPost]
        
        public JsonResult ResetPass(string token, string pass) { 
            var account = Context.Accounts.FirstOrDefault(Context => Context.Token == token);
            if (account == null)
            {
                return Json(new { msg = "Không tồn tại tài khoản. Vui lòng thử lại", url = "/Auth/ForgotPassword" });
            }
            else
            {
                if ((DateTime)account.ExpiredTokenTime < DateTime.Now)
                {
                    
                    return Json(new { msg = "Token hết hạn. Hãy thử lại sau", url = "/Auth/ForgotPassword" });
                }
                account.Password = HelperAdd.Hash(account.IDAccount + pass);
                account.Token = String.Empty;
                account.ExpiredTokenTime = DateTime.Parse("01/01/1970");
                Context.SaveChanges();
                return Json(new { msg = "Đổi mật khẩu thành công", url = "/Auth/SignAndReg" });

            }
        }
        
        public ActionResult Reset(string id)
        {

            var account = Context.Accounts.FirstOrDefault(p => p.Token == id);
            if (account == null)
            {
                ViewBag.rs = "Không tồn tại tài khoản. Vui lòng thử lại.";
                return View();
            }
            if (account != null)
            {
                if ((DateTime)account.ExpiredTokenTime < DateTime.Now)
                {
                    ViewBag.rs = "Token đã hết hạn, vui lòng thử lại sau";
                    return View();
                }
            }
            ViewBag.rs = "Null";
            ViewBag.Token = id;
            return View();

        }

    }
}