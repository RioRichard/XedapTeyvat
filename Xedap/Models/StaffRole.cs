namespace Xedap.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StaffRole")]
    public partial class StaffRole
    {
        [Key]
        [Column(Order = 0)]
        public Guid IDRole { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(64)]
        public string IDStaff { get; set; }

        public bool? IsDelete { get; set; }

        public virtual AccountStaff AccountStaff { get; set; }

        public virtual Role Role { get; set; }
    }
}
