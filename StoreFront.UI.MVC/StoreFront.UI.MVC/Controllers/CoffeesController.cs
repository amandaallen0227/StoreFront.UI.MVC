using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Controllers
{
    public class CoffeesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Coffees
        public ActionResult Index()
        {
            var coffees = db.Coffees.Include(c => c.CoffeeStatu).Include(c => c.CoffeeSupplier).Include(c => c.CoffeeType);
            return View(coffees.ToList());
        }

        // GET: Coffees/Details/5
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

        // GET: Coffees/Create
        public ActionResult Create()
        {
            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName");
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName");
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name");
            return View();
        }

        // POST: Coffees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CoffeeID,CoffeeName,TypeID,Price,Description,CoffeeStatusID,SupplierID")] Coffee coffee)
        {
            if (ModelState.IsValid)
            {
                db.Coffees.Add(coffee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName", coffee.CoffeeStatusID);
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName", coffee.SupplierID);
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name", coffee.TypeID);
            return View(coffee);
        }

        // GET: Coffees/Edit/5
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

        // POST: Coffees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CoffeeID,CoffeeName,TypeID,Price,Description,CoffeeStatusID,SupplierID")] Coffee coffee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(coffee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CoffeeStatusID = new SelectList(db.CoffeeStatus, "CoffeeStatusID", "StatusName", coffee.CoffeeStatusID);
            ViewBag.SupplierID = new SelectList(db.CoffeeSuppliers, "SupplierID", "SupplierName", coffee.SupplierID);
            ViewBag.TypeID = new SelectList(db.CoffeeTypes, "TypeID", "Name", coffee.TypeID);
            return View(coffee);
        }

        // GET: Coffees/Delete/5
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

        // POST: Coffees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Coffee coffee = db.Coffees.Find(id);
            db.Coffees.Remove(coffee);
            db.SaveChanges();
            return RedirectToAction("Index");
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
