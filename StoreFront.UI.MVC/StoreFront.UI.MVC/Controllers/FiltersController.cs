using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using StoreFront.UI.MVC.Models;
using StoreFront.DATA.EF; //access the db b/c this was created after EF

namespace StoreFront.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CoffeeQS()
        {
            var coffee = db.Coffees.Include(c => c.CoffeeStatu).Include(c => c.CoffeeSupplier).Include(c => c.CoffeeType);


            return View(coffee.ToList());
        }


    }
}