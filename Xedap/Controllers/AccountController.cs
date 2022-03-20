using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Xedap.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();

        }
        public ActionResult Register()
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
    }
}