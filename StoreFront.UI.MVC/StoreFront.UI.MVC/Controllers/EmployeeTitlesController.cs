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
    [Authorize(Roles = "Admin")]
    public class EmployeeTitlesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: EmployeeTitles
        public ActionResult Index()
        {
            return View(db.EmployeeTitles.ToList());
        }

        // GET: EmployeeTitles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeTitle employeeTitle = db.EmployeeTitles.Find(id);
            if (employeeTitle == null)
            {
                return HttpNotFound();
            }
            return View(employeeTitle);
        }

        // GET: EmployeeTitles/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: EmployeeTitles/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "TitleID,TitleName")] EmployeeTitle employeeTitle)
        {
            if (ModelState.IsValid)
            {
                db.EmployeeTitles.Add(employeeTitle);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(employeeTitle);
        }

        // GET: EmployeeTitles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeTitle employeeTitle = db.EmployeeTitles.Find(id);
            if (employeeTitle == null)
            {
                return HttpNotFound();
            }
            return View(employeeTitle);
        }

        // POST: EmployeeTitles/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TitleID,TitleName")] EmployeeTitle employeeTitle)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employeeTitle).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(employeeTitle);
        }

        // GET: EmployeeTitles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EmployeeTitle employeeTitle = db.EmployeeTitles.Find(id);
            if (employeeTitle == null)
            {
                return HttpNotFound();
            }
            return View(employeeTitle);
        }

        // POST: EmployeeTitles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EmployeeTitle employeeTitle = db.EmployeeTitles.Find(id);
            db.EmployeeTitles.Remove(employeeTitle);
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
