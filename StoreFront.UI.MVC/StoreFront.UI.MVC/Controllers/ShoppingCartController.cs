using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;
using StoreFront.UI.MVC.Models;

namespace StoreFront.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: ShoppingCart
        public ActionResult Index()
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null)
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            return View(shoppingCart);
        }

        public ActionResult AddToCart(int qty, int coffeeId)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            Coffee coffee = db.Coffees.Find(coffeeId);

            CartItemViewModel item = new CartItemViewModel(qty, coffee);

            if (shoppingCart.ContainsKey(coffee.CoffeeID))
            {
                shoppingCart[coffee.CoffeeID].Qty += qty;
            }
            else
            {
                shoppingCart.Add(coffee.CoffeeID, item);
            }

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
          
        } //end AddToCart

        public ActionResult RemoveFromCart(int id)
        {

            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart.Remove(id);

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(int coffeeId, int qty)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            shoppingCart[coffeeId].Qty = qty;

            if (shoppingCart[coffeeId].Qty == 0)
            {
                shoppingCart.Remove(coffeeId);
            }

            Session["cart"] = shoppingCart;

            return RedirectToAction("Index");

        }
    }
}