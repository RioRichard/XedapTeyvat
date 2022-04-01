using System.Collections.Generic;
using System.Linq;

namespace Xedap.Models.Repo
{
    public class ProductRepo
    {
        DataContext context = new DataContext();
        public IEnumerable<Product> GetProducts(out int TotalPage,int? page , string search )
        {
            var listProduct = context.Products;
            TotalPage = listProduct.Count();
            if (string.IsNullOrEmpty(search))
            {
                
                return listProduct.Where(p=>p.Name.Contains(search)).OrderBy(p=>p.IDProduct).Skip(((page ?? 1)-1) *10).Take(10);
            }
            else
                return listProduct.Skip(((page ?? 1) - 1) * 10).OrderBy(p => p.IDProduct).Take(10);


        }
      
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
                              IDProduct = jtable.IDProduct,
                          }).ToList();
            return output;
        }
       

        public static Product GetProductForm(DataContext context, int idProduct)
        {
            var product = context.Products.FirstOrDefault(p => p.IDProduct == idProduct);
            product.ProductAttributes = GetAttribute(context, idProduct);
            return product;
        }
        public static bool EditProduct(DataContext context, int proID, string productName, int productPrice, int productStock, string productDes, int cttr, int[] attrID, string[] productAttr1)
        {
            var Pros = context.Products.FirstOrDefault(p => p.IDProduct == proID);
            if (Pros == null)
            {
                return false;
            }
            else
            {
                

                Pros.Name = productName;
                Pros.Price = productPrice;
                Pros.Stock = productStock;
                Pros.Description = productDes;

                context.Products.Add(Pros);
                context.SaveChanges();
            }
           
           
           
           
            var proAttr = context.ProductAttributes.Where(p => p.IDProduct == proID).ToList();
            if (proAttr.Count == 0)
            {
                for (int i = 0; i < attrID.Length; i++)
                {
                    var attrProd = new ProductAttribute()
                    {
                        IDProduct = proID,
                        IDAttribute = attrID[i],
                        AttributeValue = productAttr1[i]
                    };
                    context.ProductAttributes.Add(attrProd);
                    context.SaveChanges();
                }
            }
            else
            {
                for (int i = 0; i < attrID.Length; i++)
                {
                    var x = proAttr.FirstOrDefault(p => p.IDAttribute == attrID[i]);
                    if (x == null)
                    {
                        var attrProd = new ProductAttribute()
                        {
                            IDProduct = proID,
                            IDAttribute = attrID[i],
                            AttributeValue = productAttr1[i]
                        };
                        context.ProductAttributes.Add(attrProd);
                        context.SaveChanges();
                    }
                    else
                    {
                        context.ProductAttributes.Remove(x);
                        context.SaveChanges();
                        if (!string.IsNullOrEmpty(productAttr1[i]))
                        {
                            x.IDAttribute = attrID[i];
                            x.AttributeValue = productAttr1[i];
                            context.ProductAttributes.Add(x);
                            context.SaveChanges();
                        }
                    }

                }

            }
            return true;
        }

        public static Product AddProduct(DataContext context, string productName2, int productPrice2, int productStock2, string productDes2, int idCate, int[] attr, string[] attrValue)
        {
            //var result = Helper.FileUpload(f, productpath);
            var newProduct = new Product()
            {
                Name = productName2,
                Price = productPrice2,
                Stock = productStock2,
                Description = productDes2,
                //ImageUrl = result.ImageUrl,
                IsDelete = false,
            };
            context.Products.Add(newProduct);
            context.SaveChanges();
           
        
            for (int i = 0; i < attr.Length; i++)
            {
                if (!string.IsNullOrEmpty(attrValue[i]))
                {
                    var productAttr = new ProductAttribute()
                    {
                        IDProduct = (int)newProduct.IDProduct,
                        IDAttribute = attr[i],
                        AttributeValue = attrValue[i],
                    };
                    context.ProductAttributes.Add(productAttr);
                    context.SaveChanges();
                }
            }

            //for
            return newProduct;
        }
        

    }
}