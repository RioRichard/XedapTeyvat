using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Xedap.Models
{


    [Table("ProductAttribute")]
    public partial class ProductAttribute
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDProduct { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDAttribute { get; set; }

        [StringLength(400)]
        public string AttributeValue { get; set; }

        public virtual Attribute Attribute { get; set; }

        public virtual Product Product { get; set; }

        [System.ComponentModel.DataAnnotations.Schema.NotMapped]
        public string AttributeName { get; set; }
    }
}
