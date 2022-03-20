using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Xedap.Models
{
    public class ProductRepo
    {
        public static List<ProductAttribute> GetAttribute(DataContext context, int? idProducts)
        {
            var products = context.Products.Where(p => p.IDProduct == idProducts).ToList();
            var attribute = context.Attributes.ToList();
            var productAttributes = context.ProductAttributes.ToList();
            var output = (from pro in products
                          join jtable in productAttributes
                          on pro.IDProduct equals jtable.IDProduct
                          join cate in attribute
                          on jtable.IDAttribute equals cate.IDAttribute
                          select new ProductAttribute
                          {
                              AttributeValue = jtable.AttributeValue,
                              IDAttribute = jtable.IDAttribute,
                              AttributeName = cate.AttributeName,
                              IDProduct = jtable.IDProduct

                          }).ToList();
            return output;
        }
    }
}