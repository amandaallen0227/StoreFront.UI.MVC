﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StoreFront.DATA.EF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class StoreFrontEntities : DbContext
    {
        public StoreFrontEntities()
            : base("name=StoreFrontEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Coffee> Coffees { get; set; }
        public virtual DbSet<CoffeeStatu> CoffeeStatus { get; set; }
        public virtual DbSet<CoffeeSupplier> CoffeeSuppliers { get; set; }
        public virtual DbSet<CoffeeType> CoffeeTypes { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<EmployeeTitle> EmployeeTitles { get; set; }
    }
}
