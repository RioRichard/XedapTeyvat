namespace Xedap.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AccountStaff")]
    public partial class AccountStaff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AccountStaff()
        {
            StaffRoles = new HashSet<StaffRole>();
        }

        [Key]
        [StringLength(64)]
        public string IDStaff { get; set; }

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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StaffRole> StaffRoles { get; set; }
    }
}
