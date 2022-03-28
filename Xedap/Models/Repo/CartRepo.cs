using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Xedap.Models.Repo
{
    public class CartRepo
    {
        public static Cart CreateCart(DataContext context, string userId)
        {
            var newGuid = Helper.HelperAdd.GenerateGuidCart(context);
            var newCart = new Cart()
            {
                IDAccount = userId,
                IDCart = newGuid,
                IsExpired = false,


            };
            context.SaveChanges();
            return newCart;
        }
        public static IEnumerable<ProductCart> GetAllCartItem(DataContext context, string userId)
        {
            var cart = context.Carts.FirstOrDefault(p => p.IdAccount == userId && p.IsExpired == false);
            if (cart == null)
                return null;
            var productCart = context.ProductCarts.Where(p => p.IdCart == cart.IdCart).ToList();
            if (productCart.Count == 0)
                return null;
            var product = context.Products.ToList();
            var result = (from proCart in productCart
                          join pro in product
                          on proCart.IdProduct equals (int)pro.IdProduct
                          select new ProductCart
                          {
                              IdCart = proCart.IdCart,
                              IdProduct = proCart.IdProduct,
                              Quantity = proCart.Quantity,
                              ProductName = pro.Name,
                              PaymentPrice = pro.Price,
                              UrlImage = pro.ImageUrl,
                              Stock = (int)pro.Stock

                          }).ToList();
            if (result.Count != 0)
                UpdateProductCart(context, result);
            return result;
        }
        public static List<ProductCart> GetAllCartItemInInvoice(DataContext context, Guid IdCart)
        {

            var productCart = context.ProductCarts.Where(p => p.IDCart == IdCart).ToList();

            var product = context.Products.ToList();
            var result = (from proCart in productCart
                          join pro in product
                          on proCart.IDProduct equals (int)pro.IDProduct
                          select new ProductCart
                          {
                              IDCart = proCart.IDCart,
                              IDProduct = proCart.IDProduct,
                              Quantity = proCart.Quantity,
                              ProductName = pro.Name,
                              PaymentPrice = proCart.PaymentPrice,
                              UrlImage = pro.ImageURL,
                              Total = proCart.Quantity * proCart.PaymentPrice
                          }).ToList();

            return result;
        }
        public static object GetTotalFollowProduct(DataContext context)
        {

            var productCart = GetAllCartExpired(context);
            var groupProcart = productCart.GroupBy(p => p.ProductName).Select(p => new { name = p.Key, total = p.Sum(NewMethod()) });
            var total = groupProcart.Sum(p => p.total);
            var result = groupProcart.OrderByDescending(p => p.total).Take(6);
            var returnObj = new { totals = total, results = result };
            return returnObj;
        }

        private static Func<ProductCart, int?> NewMethod()
        {
            return p => p.Quantity;
        }

        static List<ProductCart> GetAllCartExpired(DataContext context)
        {
            var productCart = new List<ProductCart>();
            var cartExpired = context.Carts.Where(p => p.IsExpired == true).ToList();
            foreach (var item in cartExpired)
            {
                productCart.AddRange(GetAllCartItemInInvoice(context, item.IDCart));
            }
            return productCart;
        }
    }
    
}