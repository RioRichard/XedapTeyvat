namespace Xedap.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Invoice")]
    public partial class Invoice
    {
        [Key]
        public Guid IDInvoice { get; set; }

        public DateTime? DateCreated { get; set; }

        public DateTime? DateExpired { get; set; }

        public Guid IDCart { get; set; }

        public int IDAddress { get; set; }

        public int IDStatus { get; set; }

        public virtual Address Address { get; set; }

        public virtual Cart Cart { get; set; }

        public virtual Status Status { get; set; }
    }
}
