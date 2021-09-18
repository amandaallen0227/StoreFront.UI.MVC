using StoreFront.DATA.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFront.UI.MVC.Models
{
    public class CartItemViewModel
    {
        public Coffee Coffee { get; set; }
        public int Qty { get; set; }

        //ctro 
        public CartItemViewModel(int qty, Coffee coffee)
        {
            //remember that the property is assigned the value of the parameter
            Qty = qty;
            Coffee = coffee;
        }
    }
}