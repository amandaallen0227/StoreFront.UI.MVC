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

        //---------------ADDED FROM CoffeeController.cs--------//


        // step 2 

        // Step 9
        //[AcceptVerbs(HttpVerbs.Post)]
        //public JsonResult AjaxDelete(int id)
        //{
        //    Coffee coffee = db.Coffees.Find(id);

        //    db.Coffees.Remove(coffee);
        //    db.SaveChanges();

        //    string confirmMessage = $"Delete Coffee item {coffee.CoffeeName} from the database!";

        //    return Json(new { id = id, message = confirmMessage });
        //}

        ////Step 13
        //[HttpGet]
        //public PartialViewResult CoffeeDetails(int id)
        //{
        //    Coffee coffee = db.Coffees.Find(id);
        //    return PartialView(coffee);

        //    //Create partial View()
        //}


        ////Create
        ////Step 18 - Create the POST action for the ajax create submission
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public JsonResult AjaxCreate(Coffee coffee)
        //{
        //    //add + save functionality
        //    db.Coffees.Add(coffee);
        //    db.SaveChanges();

        //    //return the object back to the Json view
        //    return Json(coffee);
        //}

        ////Edit
        ////Step 22 - get action that returns partial view and form
        //[HttpGet]
        //public PartialViewResult CoffeeEdit(int id)
        //{
        //    Coffee coffee = db.Coffees.Find(id);


        //    return PartialView(coffee);
        //}

        ////Step 23 - POST action that saves the changes to the coffee
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public JsonResult AjaxEdit(Coffee coffee)
        //{
        //    db.Entry(coffee).State = EntityState.Modified;
        //    db.SaveChanges();
        //    return Json(coffee);
        //}


        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}

    }
}