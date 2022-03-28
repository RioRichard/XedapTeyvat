using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Xedap.Models.Repo
{
    public class CategoryRepo
    {
        public static bool EditCategory(DataContext context, int cateID, string categoryName)
        {
            var Cate = context.Categories.FirstOrDefault(p => p.IDCategory == cateID);
            if (Cate == null)
            {
                return false;
            }
            else
            {
                Cate.CategoryName = categoryName;
                context.SaveChanges();
                return true;
            }
        }
        public static Category AddCategory(DataContext context, string categoryName2)
        {
            var newCategory = new Category()
            {
                CategoryName = categoryName2,
                Isdelete = false,
            };
            context.Categories.Add(newCategory);
            context.SaveChanges();
            return newCategory;
        }
    }
}