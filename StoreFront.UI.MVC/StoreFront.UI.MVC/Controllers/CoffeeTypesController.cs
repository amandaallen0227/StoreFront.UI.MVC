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
    public class CoffeeTypesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: CoffeeTypes
        public ActionResult Index()
        {
            return View(db.CoffeeTypes.ToList());
        }

        // GET: CoffeeTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeType coffeeType = db.CoffeeTypes.Find(id);
            if (coffeeType == null)
            {
                return HttpNotFound();
            }
            return View(coffeeType);
        }

        // GET: CoffeeTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CoffeeTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TypeID,Name")] CoffeeType coffeeType)
        {
            if (ModelState.IsValid)
            {
                db.CoffeeTypes.Add(coffeeType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(coffeeType);
        }

        // GET: CoffeeTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeType coffeeType = db.CoffeeTypes.Find(id);
            if (coffeeType == null)
            {
                return HttpNotFound();
            }
            return View(coffeeType);
        }

        // POST: CoffeeTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TypeID,Name")] CoffeeType coffeeType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(coffeeType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(coffeeType);
        }

        // GET: CoffeeTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeType coffeeType = db.CoffeeTypes.Find(id);
            if (coffeeType == null)
            {
                return HttpNotFound();
            }
            return View(coffeeType);
        }

        // POST: CoffeeTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CoffeeType coffeeType = db.CoffeeTypes.Find(id);
            db.CoffeeTypes.Remove(coffeeType);
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
