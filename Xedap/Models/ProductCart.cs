using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace Xedap.Models
{

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

        public virtual CartRepo Cart { get; set; }

        public virtual Product Product { get; set; }
        [NotMapped]
        public string ProductName { get; set; }
        [NotMapped]
        public string UrlImage { get; set; }
        [NotMapped]
        public int? Stock { get; set; }
        [NotMapped]
        public int? Total { get; set; }
    }
}
