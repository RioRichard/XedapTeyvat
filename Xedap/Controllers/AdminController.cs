using System.IO;
using System.Linq;
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
        DataContext context = new DataContext();
        //IConfiguration configuration;
        string productPath = Path.Combine(Directory.GetCurrentDirectory(), "Content", "Image");
        public ActionResult Index()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            AdminInfo info = Session["Admin"] as AdminInfo;
            var acc = Context.AccountStaffs.FirstOrDefault(p=>p.IDStaff==info.Id);
            return View(acc);
        }


        [Route("Product/{page?}")]
        //PRODUCT
        public ActionResult Product(int? page)
        {
            
            ViewBag.page = (page ?? 1);
            var search = string.Empty;
            int count = 0;
            var result = ProductRepo.GetProducts(out count, (page ?? 1), search).Where(p=>p.IsDelete==false);
            ViewBag.count = count / 10;
            ViewBag.Attributes = context.Attributes.ToList();
            ViewBag.Categories = context.Categories.ToList();
            return View(result);
            //return View(DataContext.Products);
        }
        public ActionResult DeletedProduct()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
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
        public ActionResult EditProduct(int proID, string productName, int productPrice, int productStock, string productDes, int cttr, int[] attrID, string[] productAttr1)
        {
            var result = ProductRepo.EditProduct(context, proID, productName, productPrice, productStock, productDes, cttr, attrID, productAttr1);

            return Json(result ,JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult AddProduct(string productName2, int productPrice2, int productStock2, string productDes2, int idCate, int[] attr, string[] attrValue)
        {
            ProductRepo.AddProduct(context, productName2, productPrice2, productStock2, productDes2, idCate, attr, attrValue);

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
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
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
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
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
                return Json(true) ;
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
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            ViewBag.Categories = context.Categories.ToList();
            return View(context.Attributes.Where(p => p.IsDelete == false));
        }
        
        public ActionResult DeletedAttribute()
        {
            if (Session["Admin"] == null)
            {
                return Redirect("/AdminAuth/SignIn");

            }
            return View(context.Attributes.Where(p => p.IsDelete == true));
        }
        public ActionResult DeleteAttribute(int attrID)
        {
            
            var prod = context.Attributes.FirstOrDefault(p => p.IDAttribute == attrID);
            if (prod == null)
            {
                return Json(false);
            }
            else
            {
                prod.IsDelete = true;
                context.SaveChanges();
                return Json(prod);
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
                return Json(prod);
            }
        }
    }
}