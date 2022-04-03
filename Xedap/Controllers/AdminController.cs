using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Web.Script.Services;
using System.Web.Services;
using Xedap.Models;
using Xedap.Models.Repo;
using Newtonsoft.Json;
using static Xedap.Helper.HelperAdd;
using System.Web.Hosting;
using Microsoft.Extensions.Configuration;
using System.Web;

namespace Xedap.Controllers
{
    [RoutePrefix("admin")]
    public class AdminController : BaseController
    {
        DataContext context = new DataContext();



        string productPath = HostingEnvironment.ApplicationPhysicalPath + @"Content\Image";

        //IConfiguration configuration;

        public ActionResult Index()
        {
            return View();
        }


        [Route("Product/{page?}")]
        //PRODUCT
        public ActionResult Product(int? page)
        {

            ViewBag.page = (page ?? 1);
            var search = string.Empty;
            int count = 0;
            var result = ProductRepo.GetProducts(out count, (page ?? 1), search).Where(p => p.IsDelete == false);
            ViewBag.count = count / 10;
            ViewBag.Attributes = context.Attributes.ToList();
            ViewBag.Categories = context.Categories.ToList();
            return View(result);
            //return View(DataContext.Products);
        }
        public ActionResult DeletedProduct()
        {

            return View(context.Products.Where(p => p.IsDelete == true));
        }
        public ActionResult DeleteProduct(int pdID)
        {

            var prod = context.Products.FirstOrDefault(p => p.IDProduct == pdID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.IsDelete = true;
                context.SaveChanges();
                return Json(true);
            }
        }
        public ActionResult ReStoreProduct(int pdID)
        {
            var prod = context.Products.FirstOrDefault(p => p.IDProduct == pdID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.IsDelete = false;
                context.SaveChanges();
                return Json(true);
            }
        }
        [HttpPost]
        public ActionResult EditProduct(int proID, string productName, int productPrice, int productStock, string productDes, int cttr, int[] attrID, string[] productAttr1, HttpPostedFileBase UploadEdit)
        {
            var result = ProductRepo.EditProduct(context, proID, productName, productPrice, productStock, productDes, cttr, attrID, productAttr1, UploadEdit, productPath);

            return Json(true);
        }
        [HttpPost]
        public ActionResult AddProduct(string productName2, int productPrice2, int productStock2, string productDes2, int idCate, int[] attr, string[] attrValue, HttpPostedFileBase imgUp)
        {

            ProductRepo.AddProduct(context, productName2, productPrice2, productStock2, productDes2, idCate, attr, attrValue, imgUp, productPath);

            return Json(true);
        }

        [HttpGet]
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public ActionResult getProductForm(int id)
        {
            var result = ProductRepo.GetProductForm(context, id);

            return Json(result, JsonRequestBehavior.AllowGet);
        }
        //CATEGORY
        public ActionResult Category()
        {

            ViewBag.Products = context.Products.ToList();
            ViewBag.Attributes = context.Attributes.ToList();
            return View(context.Categories.Where(p => p.Isdelete == false));
        }
        [HttpPost]
        public ActionResult EditCategory(int IdCate, string categoryName)
        {
            var result = CategoryRepo.EditCategory(context, IdCate, categoryName);
            return Json(result, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddCategory(string categoryName2)
        {
            CategoryRepo.AddCategory(context, categoryName2);
            return Json(true);
        }
        public ActionResult DeletedCategory()
        {

            return View(context.Categories.Where(p => p.Isdelete == true));
        }
        [HttpPost]
        public ActionResult DeleteCategory(int ctgrID2)
        {

            var prod = context.Categories.FirstOrDefault(p => p.IDCategory == ctgrID2);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.Isdelete = true;
                context.SaveChanges();
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
            var prod = context.Categories.FirstOrDefault(p => p.IDCategory == ctID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                context.Categories.Remove(prod);
                context.SaveChanges();
                return Json(true);
            }
        }
            public ActionResult RestoreCategory(int ctgrID)
            {

                var prod = context.Categories.FirstOrDefault(p => p.IDCategory == ctgrID);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    prod.Isdelete = false;
                    context.SaveChanges();
                    return Json(true);
                }
            }
            //ATTRIBUTE
            public ActionResult Attribute()
            {

                ViewBag.Categories = context.Categories.ToList();
                return View(context.Attributes.Where(p => p.IsDelete == false));
            }
            [HttpPost]
            public ActionResult AddAttribute (string attributeName2)
            {
                AttributeRepo.AddAttribute(context, attributeName2);
                return Json(true);
            }
            [HttpPost]
            public ActionResult EditAttribute(int attrId, string attributeName)
            {
                var result = AttributeRepo.EditAttribute(context, attrId, attributeName);
                return Json(result);
            }
        public ActionResult DeletedAttribute()
            {

                return View(context.Attributes.Where(p => p.IsDelete == true));
            }
            public ActionResult DeleteAttribute(int attrID2)
            {

                var prod = context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID2);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    prod.IsDelete = true;
                    context.SaveChanges();
                    return Json(true);
                }
            }
            public ActionResult Delete4everAttribute(int atrID)
            {
                var prod = context.Attributes.FirstOrDefault(p => p.IDAttribute == atrID);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    context.Attributes.Remove(prod);
                    context.SaveChanges();
                    return Json(true);
                }
            }
        public ActionResult RestoreAttribute(int attrID)
            {

                var prod = context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID);
                if (prod == null)
                {
                    return Json(false);
                }
                else
                {
                    prod.IsDelete = false;
                    context.SaveChanges();
                    return Json(true);
                }
            }
        }
    }
