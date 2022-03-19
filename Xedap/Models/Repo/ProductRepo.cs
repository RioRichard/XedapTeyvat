using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
}