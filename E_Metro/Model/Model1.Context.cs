﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace E_Metro.Model
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EMetroEntities2 : DbContext
    {
        public EMetroEntities2()
            : base("name=EMetroEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<MonthlyTicket> MonthlyTickets { get; set; }
        public virtual DbSet<RailWay> RailWays { get; set; }
        public virtual DbSet<StandarTicket> StandarTickets { get; set; }
        public virtual DbSet<Station> Stations { get; set; }
        public virtual DbSet<TicketSold> TicketSolds { get; set; }
        public virtual DbSet<TicketType> TicketTypes { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }
        public virtual DbSet<User> Users { get; set; }
    }
}