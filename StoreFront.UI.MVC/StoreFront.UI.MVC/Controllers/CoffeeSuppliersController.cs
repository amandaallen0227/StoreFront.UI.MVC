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
    [AllowAnonymous]
    public class CoffeeSuppliersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: CoffeeSuppliers
        public ActionResult Index()
        {
            return View(db.CoffeeSuppliers.ToList());
        }

        // GET: CoffeeSuppliers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeSupplier coffeeSupplier = db.CoffeeSuppliers.Find(id);
            if (coffeeSupplier == null)
            {
                return HttpNotFound();
            }
            return View(coffeeSupplier);
        }

        // GET: CoffeeSuppliers/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: CoffeeSuppliers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "SupplierID,SupplierName")] CoffeeSupplier coffeeSupplier)
        {
            if (ModelState.IsValid)
            {
                db.CoffeeSuppliers.Add(coffeeSupplier);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(coffeeSupplier);
        }

        // GET: CoffeeSuppliers/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeSupplier coffeeSupplier = db.CoffeeSuppliers.Find(id);
            if (coffeeSupplier == null)
            {
                return HttpNotFound();
            }
            return View(coffeeSupplier);
        }

        // POST: CoffeeSuppliers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "SupplierID,SupplierName")] CoffeeSupplier coffeeSupplier)
        {
            if (ModelState.IsValid)
            {
                db.Entry(coffeeSupplier).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(coffeeSupplier);
        }

        // GET: CoffeeSuppliers/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeSupplier coffeeSupplier = db.CoffeeSuppliers.Find(id);
            if (coffeeSupplier == null)
            {
                return HttpNotFound();
            }
            return View(coffeeSupplier);
        }

        // POST: CoffeeSuppliers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            CoffeeSupplier coffeeSupplier = db.CoffeeSuppliers.Find(id);
            db.CoffeeSuppliers.Remove(coffeeSupplier);
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
