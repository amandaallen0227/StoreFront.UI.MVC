﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations; //added for Validation
using System.Linq;
using System.Web;

namespace StoreFront.UI.MVC.Models
{
    public class ContactViewModel
    {

        [Required(ErrorMessage = "* Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "* Email is required")]
        [EmailAddress]
        public string Email { get; set; }

        [Required(ErrorMessage = "* Subject is required")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "* Message is required")]
        [UIHint("MultilineText")]
        public string Message { get; set; }
    }
}