using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Xedap.Models
{


    public partial class Status
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Status()
        {
            Invoices = new HashSet<Invoice>();
        }

        [Key]
        public int IDStatus { get; set; }

        [StringLength(64)]
        public string StatusName { get; set; }

        public bool? IsDelete { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Invoice> Invoices { get; set; }
    }
}
