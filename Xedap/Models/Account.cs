using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;

namespace Xedap.Models
{
    [Table("Account")]
    public partial class Account
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Account()
        {
            AccountAddresses = new HashSet<AccountAddress>();
            Carts = new HashSet<Cart>();
        }

        [Key]
        [StringLength(64)]
        public string IDAccount { get; set; }

        [StringLength(32)]
        public string UserName { get; set; }

        [MaxLength(64)]
        public byte[] Password { get; set; }

        [StringLength(64)]
        public string Email { get; set; }

        [StringLength(64)]
        public string Token { get; set; }

        public DateTime? ExpiredTokenTime { get; set; }

        public bool? IsConfirmed { get; set; }

        public bool? IsDelete { get; set; }

        [StringLength(64)]
        public string FullName { get; set; }

        public bool? Gender { get; set; }
        [NotMapped]
        public int? TotalBought { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AccountAddress> AccountAddresses { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }
    }
}
