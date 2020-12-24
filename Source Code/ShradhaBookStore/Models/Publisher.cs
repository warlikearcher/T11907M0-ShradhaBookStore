using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ShradhaBookStore.Models
{
    [Table("Publisher")]
    public class Publisher
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Required(ErrorMessage = "Publisher Code is required.....")]
        [RegularExpression(@"^([A-Z]{2})+([0-9]{1})$", ErrorMessage = "Publisher must have 3 character (Ex: KD0 = KimDong + 0 )")]
        [StringLength(3, MinimumLength = 3, ErrorMessage = "Publisher must have 3 character (Ex: KD0 = KimDong + 0 )")]
        public string PublisherCode { get; set; }
        [Required(ErrorMessage = "Publisher Name is required.....")]
        [StringLength(150, MinimumLength = 1, ErrorMessage = "Publisher Name must between 3 and 150 character")]
        public string PublisherName { get; set; }
    }
}
