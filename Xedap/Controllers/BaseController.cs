using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Xedap.Models;
using Xedap.Models.Repo;

namespace Xedap.Controllers
{
    public class BaseController : Controller
    {
        protected DataContext Context = new DataContext();
        protected ProductRepo ProductRepo = new ProductRepo();
        protected AuthRepo AuthRepo;

        public BaseController()
        {
            AuthRepo = new AuthRepo(Context);
        }
    }
}