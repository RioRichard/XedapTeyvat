using PagedList;
using System;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;
using System.Web.Script.Services;
using System.Web.Services;
using Xedap.Helper;
using Xedap.Models;
using Xedap.Models.Repo;

namespace Xedap.Controllers
{
    [RoutePrefix("admin")]
    public class AdminController : BaseController
    {
        



        string productPath = HostingEnvironment.ApplicationPhysicalPath + @"Content\Image";

        //IConfiguration configuration;

        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            AdminInfo info = Session["Admin"] as AdminInfo;
            var acc = base.Context.AccountStaffs.FirstOrDefault(p => p.IDStaff == info.Id);
            return View(acc);
        }
        public ActionResult ChangePassword()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(string currentPass,string newPass)
        {
            var info = Session["Admin"] as AdminInfo;
            var acc = base.Context.AccountStaffs.FirstOrDefault(p => p.IDStaff == info.Id);
            if (acc.Password.SequenceEqual(HelperAdd.Hash(acc.IDStaff + currentPass)))
            {
                acc.Password = HelperAdd.Hash(acc.IDStaff + newPass);
                base.Context.SaveChanges();
                ViewBag.Msg = "Đổi mật khẩu thành công!";
            }
            else
                ViewBag.Msg = "Sai mật khẩu hiện tại!";

            return View();
        }


        //PRODUCT
        public ActionResult Product(int? page)
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

               
            }
            ViewBag.Attributes = Context.Attributes.ToList();
            ViewBag.Categories = Context.Categories.ToList();
            ViewBag.Product = Context.Products.ToList();
            if (page == null) page = 1;
            var links = (from s in Context.Products select s).Where(i => i.IsDelete == false).OrderBy(m => m.Name);
            int pageSize = 6;
            int pageNumber = (page ?? 1);
            return View(links.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult DeletedProduct()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            return View(Context.Products.Where(p => p.IsDelete == true));
        }
        public ActionResult DeleteProduct(int pdID)
        {

            var prod = Context.Products.FirstOrDefault(p => p.IDProduct == pdID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.IsDelete = true;
                Context.SaveChanges();
                return Json(true);
            }
        }
        public ActionResult ReStoreProduct(int pdID)
        {
            var prod = Context.Products.FirstOrDefault(p => p.IDProduct == pdID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.IsDelete = false;
                Context.SaveChanges();
                return Json(true);
            }
        }
        [HttpPost]
        public ActionResult EditProduct(int proID, string productName, int productPrice, int productStock, string productDes, int cttr, int[] attrID, string[] productAttr1, HttpPostedFileBase UploadEdit)
        {
            var result = ProductRepo.EditProduct(Context, proID, productName, productPrice, productStock, productDes, cttr, attrID, productAttr1, UploadEdit, productPath);

            return Json(true);
        }
        [HttpPost]
        public ActionResult AddProduct(string productName2, int productPrice2, int productStock2, string productDes2, int idCate, int[] attr, string[] attrValue, HttpPostedFileBase imgUp)
        {

            ProductRepo.AddProduct(Context, productName2, productPrice2, productStock2, productDes2, idCate, attr, attrValue, imgUp, productPath);

            return Json(true);
        }

        [HttpGet]
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public ActionResult getProductForm(int id)
        {
            var result = ProductRepo.GetProductForm(Context, id);

            return Json(result, JsonRequestBehavior.AllowGet);
        }
        //CATEGORY
        public ActionResult Category()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            ViewBag.Products = Context.Products.ToList();
            ViewBag.Attributes = Context.Attributes.ToList();
            return View(Context.Categories.Where(p => p.Isdelete == false));
        }
        [HttpPost]
        public ActionResult EditCategory(int IdCate, string categoryName)
        {
            var result = CategoryRepo.EditCategory(Context, IdCate, categoryName);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddCategory(string categoryName2)
        {
            CategoryRepo.AddCategory(Context, categoryName2);
            return Json(true);
        }
        public ActionResult DeletedCategory()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            return View(Context.Categories.Where(p => p.Isdelete == true));
        }
        [HttpPost]
        public ActionResult DeleteCategory(int ctgrID2)
        {

            var prod = Context.Categories.FirstOrDefault(p => p.IDCategory == ctgrID2);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.Isdelete = true;
                Context.SaveChanges();
                return Json(true);
            }
        }

        //public ActionResult DeleteProduct4Ever(int prID)
        //{
        //    var prod = context.Products.FirstOrDefault(p => p.IDProduct == prID);
        //    var checkCart = context.ProductCarts.FirstOrDefault(p => p.IDProduct == prID);
        //    var checkAttr = context.ProductAttributes.FirstOrDefault(p => p.IDProduct == prID);
        //    if (prod == null)
        //    {
        //        return Json(false);
        //    }
        //    else
        //    {
                
        //        if(checkAttr!= null)
        //        {
        //            if (checkCart != null)
        //            {
        //                context.ProductCarts.Remove(checkCart);
                       
        //                context.ProductAttributes.Remove(checkAttr);
                       
        //                context.Products.Remove(prod);
        //                context.SaveChanges();
        //            }    
        //            else
        //            {
        //                context.ProductAttributes.Remove(checkAttr);
                       
        //                context.Products.Remove(prod);
        //                context.SaveChanges();
        //            }    
                   
        //        }
        //        else
        //        {
        //            context.Products.Remove(prod);
        //            context.SaveChanges();
        //        }    
                
        //        return Json(true);
        //    }
        //}

        [HttpPost]
        public ActionResult Delete4everCategory(int ctID)
        {
            var prod = Context.Categories.FirstOrDefault(p => p.IDCategory == ctID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                Context.Categories.Remove(prod);
                Context.SaveChanges();
                return Json(true);
            }
        }
            public ActionResult RestoreCategory(int ctgrID)
            {

                var prod = Context.Categories.FirstOrDefault(p => p.IDCategory == ctgrID);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    prod.Isdelete = false;
                    Context.SaveChanges();
                    return Json(true);
                }
            }
            //ATTRIBUTE
            public ActionResult Attribute()
            {

                ViewBag.Categories = Context.Categories.ToList();
                return View(Context.Attributes.Where(p => p.IsDelete == false));
            }
            [HttpPost]
            public ActionResult AddAttribute (string attributeName2)
            {
                AttributeRepo.AddAttribute(Context, attributeName2);
                return Json(true);
            }
            [HttpPost]
            public ActionResult EditAttribute(int attrId, string attributeName)
            {
                var result = AttributeRepo.EditAttribute(Context, attrId, attributeName);
                return Json(result);
            }
        public ActionResult DeletedAttribute()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            return View(Context.Attributes.Where(p => p.IsDelete == true));
        }
        //public ActionResult DeleteAttribute(int attrID)
        //{
            
        //    var prod = Context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID);
        //    if (prod == null)
        //    {
        //        return Json(false);
        //    }
        //    else
        //    {
        //        prod.IsDelete = true;
        //        Context.SaveChanges();
        //        return Json(prod);
        //    }
        //}

        [HttpPost]
        public ActionResult DeleteAttribute(int attrID2)
        {

            var prod = Context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID2);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.IsDelete = true;
                Context.SaveChanges();
                return Json(true);
            }
        }
        public ActionResult Delete4everAttribute(int atrID)
            {
                var prod = Context.Attributes.FirstOrDefault(p => p.IDAttribute == atrID);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    Context.Attributes.Remove(prod);
                    Context.SaveChanges();
                    return Json(true);
                }
            }
        public ActionResult RestoreAttribute(int attrID)
            {

                var prod = Context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    prod.IsDelete = false;
                    Context.SaveChanges();
                    return Json(true);
                }
            }
        public ActionResult Chart()
        {
            return View();
        }
        public ActionResult Setting()
        {
            return View();
        }
        public ActionResult Invoicedetail()
        {
            ViewBag.Status = Context.Status.ToList();
            var result = InvoiceRepo.GetAllInvoice(Context);
            return View(result);
        }
        [HttpPost]
        public ActionResult EditInvoicedetail(int SelectStatus, Guid IdInvoice)
        {

            InvoiceRepo.EditInvoice(Context, SelectStatus, IdInvoice);

            return Json(true);

        }

        public ActionResult DashboardBar()
        {

            var accounts = InvoiceRepo.TotalBuyFolowUser(Context);
            var result = accounts.OrderByDescending(p => p.TotalBought).Select(p => new { p.UserName, p.TotalBought });
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        public ActionResult DashboardPie()
        {
            var result = CartRepo.GetTotalFollowProduct(Context);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
    }
