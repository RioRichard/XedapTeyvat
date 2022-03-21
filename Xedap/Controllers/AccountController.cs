using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Xedap.Controllers
{
    
    public class AccountController : BaseController
    {
        
        // GET: Account
        public ActionResult Index()
        {
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
    }
}