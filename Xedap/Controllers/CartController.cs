using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;
using Xedap.Models.Repo;
namespace Xedap.Controllers
{
    public class CartController : BaseController
    {
        // GET: Cart
        //public CartController(DataContext context) : base(context) { }

        [HttpPost]
        public ActionResult AddItemToCart(int idProduct, int Quantity)
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            var result = CartRepo.AddItem(Context, userId, idProduct, Quantity);
            if (result == true)
                TempData["messageAddItem"] = "Thêm vào giỏ hàng thành công";
            else
                TempData["messageAddItem"] = "Thêm vào giỏ hàng không thành công";

            return Redirect($"/product/productdetail/{idProduct}");
        }
        public ActionResult Add1ItemToCart(int idProduct)
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            var result = CartRepo.AddItem(Context, userId, idProduct, 1);
            if (result == true)
                TempData["messageAddItem"] = "Thêm vào giỏ hàng thành công";
            else
                TempData["messageAddItem"] = "Thêm vào giỏ hàng không thành công";

            return Json(idProduct);
        }
        [HttpPost]
        public ActionResult ChangeQuantityCart(string CartID, int ProductId, int Quantity)
        {
            var cartid = Guid.Parse(CartID);
            var proCart = Context.ProductCarts.FirstOrDefault(p => p.IDCart == cartid && p.IDProduct == ProductId);
            proCart.Quantity = Quantity;
            if (proCart.Quantity == 0)
            {
                Context.ProductCarts.Remove(proCart);
            }
            else
            {
                proCart.Quantity = Quantity;
                Context.SaveChanges();
            }    
            Context.SaveChanges();
            return Json(Quantity);
        }
        [HttpPost]
        public ActionResult DeleteProductCart(string CartID, int ProductId)
        {
            var cartid = Guid.Parse(CartID);
            var proCart = Context.ProductCarts.FirstOrDefault(p => p.IDCart == cartid && p.IDProduct == ProductId);
            Context.ProductCarts.Remove(proCart);
            Context.SaveChanges();
            return Json(true);
        }
        [HttpPost]
        public ActionResult ChargeCart(int IdAddress)
        {
            var userId = System.Web.HttpContext.Current.User.Identity.Name;
            var result = CartRepo.ChargeCart(Context, userId, IdAddress);
            return Json(result);
        }
    }
}