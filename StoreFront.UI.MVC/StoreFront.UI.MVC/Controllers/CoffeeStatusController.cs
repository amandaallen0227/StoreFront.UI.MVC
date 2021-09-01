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
    public class CoffeeStatusController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: CoffeeStatus
        public ActionResult Index()
        {
            return View(db.CoffeeStatus.ToList());
        }

        // GET: CoffeeStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeStatu coffeeStatu = db.CoffeeStatus.Find(id);
            if (coffeeStatu == null)
            {
                return HttpNotFound();
            }
            return View(coffeeStatu);
        }

        // GET: CoffeeStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CoffeeStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CoffeeStatusID,StatusName")] CoffeeStatu coffeeStatu)
        {
            if (ModelState.IsValid)
            {
                db.CoffeeStatus.Add(coffeeStatu);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(coffeeStatu);
        }

        // GET: CoffeeStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeStatu coffeeStatu = db.CoffeeStatus.Find(id);
            if (coffeeStatu == null)
            {
                return HttpNotFound();
            }
            return View(coffeeStatu);
        }

        // POST: CoffeeStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CoffeeStatusID,StatusName")] CoffeeStatu coffeeStatu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(coffeeStatu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(coffeeStatu);
        }

        // GET: CoffeeStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CoffeeStatu coffeeStatu = db.CoffeeStatus.Find(id);
            if (coffeeStatu == null)
            {
                return HttpNotFound();
            }
            return View(coffeeStatu);
        }

        // POST: CoffeeStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CoffeeStatu coffeeStatu = db.CoffeeStatus.Find(id);
            db.CoffeeStatus.Remove(coffeeStatu);
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
