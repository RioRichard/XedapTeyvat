using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace Xedap.Models
{
    

    [Table("AccountAddress")]
    public partial class AccountAddress
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDAddress { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(64)]
        public string IDAccount { get; set; }
        public bool? IsDefault { get; set; }

        [NotMapped]
        public string AdresssAcc { get; set; }
        public virtual Account Account { get; set; }

        public virtual Address Address { get; set; }
    }
}
