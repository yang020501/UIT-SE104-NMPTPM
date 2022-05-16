//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class MonthlyTicket
    {
        public int Id { get; set; }
        public Nullable<int> IdType { get; set; }
        public Nullable<int> RailwayID { get; set; }
        public string ClientName { get; set; }
        public string CLientIdentity { get; set; }
        public string Phone { get; set; }
        public string StartDate { get; set; }
        public string ExpireDate { get; set; }
        public Nullable<decimal> Price { get; set; }
    
        public virtual TicketType TicketType { get; set; }
        public virtual RailWay RailWay { get; set; }
    }
}
