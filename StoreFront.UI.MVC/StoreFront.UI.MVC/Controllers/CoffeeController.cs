using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;
using StoreFront.UI.MVC.Utilities;

namespace StoreFront.UI.MVC.Controllers
{
    [Authorize]
    public class CoffeeController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();
        #region Scaffolded, Non-Ajax CRUD Functionality

        
        // GET: Coffee
        [AllowAnonymous]
        public ActionResult Index()
        {
            var coffees = db.Coffees.Include(c => c.CoffeeStatu).Include(c => c.CoffeeSupplier).Include(c => c.CoffeeType);
            return View(coffees.ToList());
        }

        // GET: Coffee/Details/5 
        [AllowAnonymous]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coffee coffee = db.Coffees.Find(id);
            if (coffee == null)
            {
                return HttpNotFound();
            }
            return View(coffee);
        }

        // GET: Coffee/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName");
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName");
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name");
            return View();
        }

        // POST: Coffee/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]    
        public ActionResult Create([Bind(Include = "CoffeeID,CoffeeName,TypeID,Price,Description,CoffeeStatusID,SupplierID,Images,Country,Region")] Coffee coffee, HttpPostedFileBase coffeeBag)
        {
            if (ModelState.IsValid)
            {
                #region File Upload w/ Utility
                string file = "NoImage.png";

                if (coffeeBag != null)
                {
                    file = coffeeBag.FileName;

                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = {".jpeg",".jpg",".gif",".png" };

                    if (goodExts.Contains(ext))
                    {
                        file = Guid.NewGuid() + ext;

                        #region Resize Image

                        //file path
                        string savePath = Server.MapPath("~/Content/images/coffeemessenger");
                        //image file
                        Image convertedImage = Image.FromStream(coffeeBag.InputStream);
                        //max img size
                        int maxImageSize = 500;

                        //max thumb size
                        int maxThumbSize = 100;

                        //call the imageutlity to do work
                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                    }
                    else
                    {
                        file = "NoImage.png";
                    }

                    coffee.Images = file;

                }
                #endregion
                db.Coffees.Add(coffee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName", coffee.CoffeeStatusID);
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName", coffee.SupplierID);
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name", coffee.TypeID);
            return View(coffee);
        }

        // GET: Coffee/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coffee coffee = db.Coffees.Find(id);
            if (coffee == null)
            {
                return HttpNotFound();
            }
            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName", coffee.CoffeeStatusID);
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName", coffee.SupplierID);
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name", coffee.TypeID);
            return View(coffee);
        }

        // POST: Coffee/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]      
        public ActionResult Edit([Bind(Include = "CoffeeID,CoffeeName,TypeID,Price,Description,CoffeeStatusID,SupplierID,Images,Country,Region")] Coffee coffee, HttpPostedFileBase coffeeBag)
        {
            if (ModelState.IsValid)
            {
                #region File Upload w/ Utility               

                string file = "";

                if (coffeeBag != null)
                {
                    
                    file = coffeeBag.FileName;                  

                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = { ".jpg", ".jpeg", ".png", ".gif" };

                    if (goodExts.Contains(ext))
                    {

                        
                        file = Guid.NewGuid() + ext;

                        #region Resize Image
                        
                        string savePath = Server.MapPath("~/Content/imgstore/books/");

                        Image convertedImage = Image.FromStream(coffeeBag.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion

                        #region Delete the old image
                        if (coffee.Images != null && coffee.Images != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/imgstore/books/");
                            ImageUtility.Delete(path, coffee.Images);
                        }
                        #endregion

                        coffee.Images = file;

                    }
                }
                #endregion
                db.Entry(coffee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName", coffee.CoffeeStatusID);
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName", coffee.SupplierID);
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name", coffee.TypeID);
            return View(coffee);
        }

        // GET: Coffee/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Coffee coffee = db.Coffees.Find(id);
            if (coffee == null)
            {
                return HttpNotFound();
            }
            return View(coffee);
        }

        // POST: Coffee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]    
        public ActionResult DeleteConfirmed(int id)
        {
            Coffee coffee = db.Coffees.Find(id);
            db.Coffees.Remove(coffee);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        #endregion

        // step 2 

        // Step 9
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Coffee coffee = db.Coffees.Find(id);

            db.Coffees.Remove(coffee);
            db.SaveChanges();

            string confirmMessage = $"Delete Coffee item {coffee.CoffeeName} from the database!";

            return Json(new { id = id, message = confirmMessage });
        }

        //Step 13
        [HttpGet]
        public PartialViewResult CoffeeDetails(int id)
        {
            Coffee coffee = db.Coffees.Find(id);
            return PartialView(coffee);

            //Create partial View()
        }

        //Create
        //Step 18 - Create the POST action for the ajax create submission
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Coffee coffee)
        {
            //add + save functionality
            db.Coffees.Add(coffee);
            db.SaveChanges();

            //return the object back to the Json view
            return Json(coffee);
        }

        //Edit
        //Step 22 - get action that returns partial view and form
        [HttpGet]
        public PartialViewResult CoffeeEdit(int id)
        {
            Coffee coffee = db.Coffees.Find(id);


            return PartialView(coffee);
        }

        //Step 23 - POST action that saves the changes to the coffee
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Coffee coffee)
        {
            db.Entry(coffee).State = EntityState.Modified;
            db.SaveChanges();
            return Json(coffee);
        }





        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
