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
    [Authorize]
    public class AccountController : BaseController
    {
        
        // GET: Account
        
        
        public ActionResult Index()
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            var account = Context.Accounts.FirstOrDefault(p => p.IDAccount == userId);
            return View(account);
        }
        [HttpPost]
        public ActionResult Index(DataContext context, string userId, string fullname, bool? gender)
        {

            userId = System.Web.HttpContext.Current.User.Identity.Name;
            var account = context.Accounts.FirstOrDefault(p => p.IDAccount == userId);
            account.FullName = fullname;
            account.Gender = gender;
            context.SaveChanges();
            return Redirect("/account");
        }
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(DataContext context, string userId, string currentPass, string newPass)
        {
            userId = System.Web.HttpContext.Current.User.Identity.Name;
            Account account = context.Accounts.FirstOrDefault(p => p.IDAccount == userId);
            if (account is null)
            {
                TempData["messageChangePass"] = "Tài khoản không tồn tại";
            }
            else
            {
                var password = Helper.HelperAdd.Hash(account.IDAccount + currentPass);
                var passwordEqualCheck = password.SequenceEqual(account.Password);
                if (!passwordEqualCheck)
                {
                    TempData["messageChangePass"] = "Mật khẩu cũ không đúng";
                }
                else
                {
                    var newPassBeforeHash = account.IDAccount + newPass;
                    var hashNewPass = Helper.HelperAdd.Hash(newPassBeforeHash);
                    account.Password = hashNewPass;
                    context.SaveChanges();
                    TempData["messageChangePass"] = "Đổi mật khẩu thành công";
                }
            }
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
        public ActionResult Address()
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            //var result = AddressRepo.GetAddressByUser(Context, userId);

            return View(Context.AccountAddresses.Where(p=>p.IDAccount==userId).ToList());
        }

        //create a string MD5
        //[Authorize]
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
        [HttpPost]
        public ActionResult AddAddress(string address, string phone, string receiver, bool isDef)
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;

            AddressRepo.AddAccount(Context, userId, address, phone, receiver, isDef);

            return Json(true);
        }
        [HttpPost]
        public ActionResult ChangeDefalut(int AddID)
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            AddressRepo.SetDefault(Context, userId, AddID);
            return Json(true);
        }
    }
}