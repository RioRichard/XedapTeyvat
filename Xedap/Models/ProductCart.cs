namespace Xedap.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductCart")]
    public partial class ProductCart
    {
        [Key]
        [Column(Order = 0)]
        public Guid IDCart { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDProduct { get; set; }

        public int? Quantity { get; set; }

        public int? PaymentPrice { get; set; }

        public virtual Cart Cart { get; set; }

        public virtual Product Product { get; set; }
    }
}
