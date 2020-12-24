using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace ShradhaBookStore.Models
{
    [Table("Category")]
    public class Category
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Required(ErrorMessage = "Category Code is required.....")]
        [RegularExpression(@"^([A-Z]{1})+([0-9]{1})$", ErrorMessage = "Publisher must have 3 character (Ex: KD0 = KimDong + 0 )")]
        [StringLength(2, MinimumLength = 2, ErrorMessage = "CategoryCode must have 2 character: 1 alphanumeric character and 1 numeric character(Ex: B9)")]
        public string CategoryCode { get; set; }
        [Required(ErrorMessage = "Category Name is required.....")]
        [StringLength(50, MinimumLength = 1, ErrorMessage = "Category Name must between 3 and 50 character")]
        public string CategoryName { get; set; }

    }
}
