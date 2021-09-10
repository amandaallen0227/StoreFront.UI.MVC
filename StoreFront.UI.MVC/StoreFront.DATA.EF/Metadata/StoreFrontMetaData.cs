using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StoreFront.DATA.EF//.Metadata
{
    //public class SomethingMetadata 
    //{ 
    //     //copy props from EF class here and apply data annotations 
    //}
    //
    //[MetadataType(typeof(SomethingMetadata))]
    //public partial class Something 
    //{ 
    //     //this is typically empty, unless you need to create custom properties
    //}

    #region Coffee

    public class CoffeeMetadata
    {
        //copy props from EF class here and apply data annotations 
        public int CoffeeID { get; set; }

        [Required(ErrorMessage = "*  Name is required")]
        [StringLength(50, ErrorMessage = "* Cannot exceed 50 characters")]
        [Display(Name = "Coffe Name")]
        public string CoffeeName { get; set; }

        [Display(Name = "Type")]
        public int TypeID { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Value must be greater than 0")]
        [DisplayFormat(DataFormatString = "{0:c}")]
        public decimal Price { get; set; }

        [StringLength(1000, ErrorMessage = "* Cannot exceed 1000 characters")]
        [UIHint("MultilineText")]
        public string Description { get; set; }

        [Display(Name = "Status")]
        public int CoffeeStatusID { get; set; }

        [Display(Name = "Supplier")]
        public Nullable<int> SupplierID { get; set; }

    }

    [MetadataType(typeof(CoffeeMetadata))]
    public partial class Coffee 
    { 
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region CoffeeStatus 

    public class CoffeeStatusMetadata 
    {
        //copy props from EF class here and apply data annotations 
        public int CoffeeStatusID { get; set; }

        [Required(ErrorMessage = "* Status Name is required")]
        [StringLength(15, ErrorMessage = "* Cannot exceed 15 characters")]
        [Display(Name = "Status Name")]
        public string StatusName { get; set; }
    }
    
    [MetadataType(typeof(CoffeeStatusMetadata))]
    public partial class CoffeeStatus 
    { 
        //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region CoffeeSuppliers


    public class SomethingMetadata 
    {
        //copy props from EF class here and apply data annotations 
        public int SupplierID { get; set; }

        [Required(ErrorMessage = "* Supplier is required")]
        [StringLength(15, ErrorMessage = "* Cannot exceed 15 characters")]
        [Display(Name = "Supplier")]
        public string SupplierName { get; set; }
    }
    
    [MetadataType(typeof(SomethingMetadata))]
    public partial class Something 
    { 
         //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region CoffeeType

    public class CoffeeTypeMetadata 
    {
        //copy props from EF class here and apply data annotations
        public int TypeID { get; set; }

        [Required(ErrorMessage = "* Name is required")]
        [StringLength(15, ErrorMessage = "* Cannot exceed 15 characters")]     
        public string Name { get; set; }
    }
    
    [MetadataType(typeof(CoffeeTypeMetadata))]
    public partial class CoffeeType
    { 
         //this is typically empty, unless you need to create custom properties
    }


    #endregion

    #region Customer


    public class CustomerMetadata 
    {
        //copy props from EF class here and apply data annotations 
        public int CustomerID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters")]
        [Display(Name = "First Name")]
        public string FirstN { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters")]
        [Display(Name = "Last Name")]
        public string LastN { get; set; }

        [Display(Name = "Member")]
        public bool IsMember { get; set; }

        [Required(ErrorMessage = "* Address is required")]
        [StringLength(25, ErrorMessage = "* Cannot exceed 25 characters")]
        public string Address { get; set; }

        [Required(ErrorMessage = "* City is required")]
        [StringLength(15, ErrorMessage = "* Cannot exceed 15 characters")]
        public string City { get; set; }

        [Required(ErrorMessage = "* State is required")]
        [StringLength(2, ErrorMessage = "* Cannot exceed 2 characters")]
        public string State { get; set; }

        [Required(ErrorMessage = "* Zip is required")]
        [StringLength(12, ErrorMessage = "* Cannot exceed 12 characters")]
        public string PostalCode { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }
    }
    
    [MetadataType(typeof(CustomerMetadata))]
    public partial class Customer 
    { 
         //this is typically empty, unless you need to create custom properties
    }

    #endregion

    #region Employee
    public class EmployeeMetadata 
    {
        //copy props from EF class here and apply data annotations
        public int EmployeeID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters")]
        [Display(Name = "First Name")]
        public string FirstN { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [StringLength(20, ErrorMessage = "* Cannot exceed 20 characters")]
        [Display(Name = "Last Name")]
        public string LastN { get; set; }

        [Display(Name = "Title")]
        public Nullable<int> TitleID { get; set; }

        [Required(ErrorMessage = "* Birth Date is required")]
        [StringLength(10, ErrorMessage = "* Cannot Exceed 10 characters")]
        [Display(Name = "Birth Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public string BirthDate { get; set; }

        [Display(Name = "Hire Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public string HireDate { get; set; }

        [Required(ErrorMessage = "* Address is required")]
        [StringLength(25, ErrorMessage = " Cannot exceed 25 characters")]
        public string Address { get; set; }


        [Required(ErrorMessage = "* City is required")]
        [StringLength(15, ErrorMessage = " Cannot exceed 15 characters")]
        public string City { get; set; }

        [Required(ErrorMessage = "* State is required")]
        [StringLength(2, ErrorMessage = " Cannot exceed 2 characters")]
        public string State { get; set; }

        [Required(ErrorMessage = "* Zip is required")]
        [StringLength(12, ErrorMessage = " Cannot exceed 12 characters")]
        public string PostalCode { get; set; }



        public string Images { get; set; }

        [StringLength(12, ErrorMessage = " Cannot exceed 12 characters")]
        public string Phone { get; set; }
    }
    
    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee 
    { 
         //this is typically empty, unless you need to create custom properties
    }
    #endregion

    #region EmployeeTitle

    public class EmployeeIDMetadata 
    {
        //copy props from EF class here and apply data annotations 
        public int TitleID { get; set; }

        [Display(Name = "Title")]
        public string TitleName { get; set; }
    }
    
    [MetadataType(typeof(EmployeeIDMetadata))]
    public partial class EmployeeID 
    { 
         //this is typically empty, unless you need to create custom properties
    }


    #endregion
}