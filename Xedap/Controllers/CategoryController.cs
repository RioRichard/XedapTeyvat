using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Xedap.Models;

namespace Xedap.Controllers
{
    public class CategoryController : Controller
    {

        public ActionResult Index(int? page, int? id )
        {

            DataContext context = new DataContext();
            if (page == null) page = 1;
            IEnumerable<Product> links;
            if(id == null)
                links = (from s in context.Products
                         select s).OrderBy(x => x.IDProduct);
            else
                links = (from s in context.Products
                         where s.IDCategory == id
                         select s).OrderBy(x => x.IDProduct);
    


            int pageSize = 6;
            int pageNumber = (page ?? 1);


            return View(links.ToPagedList(pageNumber, pageSize) );
        }
       
    }
}