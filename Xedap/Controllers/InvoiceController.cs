using System;
using System.Web.Mvc;
using Xedap.Models.Repo;
namespace Xedap.Controllers
{
    public class InvoiceController : BaseController
    {
        // GET: Invoice


        //[Microsoft.AspNetCore.Authorization.Authorize(AuthenticationSchemes = "Staff_Scheme,User_Scheme")]
        
        public ActionResult InvoiceDetail(string idInvoice)
        {
            var result = InvoiceRepo.GetInvoiceDetail(Context, Guid.Parse(idInvoice));
            return Json(result, JsonRequestBehavior.AllowGet);

        }
    }
}