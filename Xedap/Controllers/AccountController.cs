using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;

namespace Xedap.Controllers
{
    
    public class AccountController : BaseController
    {
        DataContext DataContext = new DataContext();
        // GET: Account
       
        
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

        //GET: Register

        public ActionResult Register()
        {
            return View();

        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(Account _user)
        {
            if (ModelState.IsValid)
            {
                var check = DataContext.Accounts.FirstOrDefault(s => s.IDAccount == _user.IDAccount);
                if (check == null)
                {
                    
                    DataContext.Configuration.ValidateOnSaveEnabled = false;
                    DataContext.Accounts.Add(_user);
                    DataContext.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Email already exists";
                    return View();
                }


            }
            return View();


        }
        public ActionResult Address()
        {
            return View(DataContext.Addresses);
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
            return View(DataContext.Carts);
        }
        public ActionResult Invoice()
        {
            return View(DataContext.Invoices);
        }
        public ActionResult Login()
        {
            return View();

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string email, string password)
        {
            if (ModelState.IsValid)
            {


               
                var data = DataContext.Accounts.Where(s => s.Email.Equals(email) && s.Password.Equals(password)).ToList();
                if (data.Count() > 0)
                {                
                    Session["IDAccount"] = data.FirstOrDefault().IDAccount;
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }


        //Logout
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Login");
        }
    }
}