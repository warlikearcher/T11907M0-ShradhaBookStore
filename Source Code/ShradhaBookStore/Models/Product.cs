using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel;
using System.Web;

namespace ShradhaBookStore.Models
{
    [Table("Product")]
    public class Product
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        [Required(ErrorMessage = "Product Code is required.....")]
        [StringLength(7, MinimumLength = 7, ErrorMessage = "Product must have 7 character (Ex: B1KD001 => B1(CategoryCode) + KD0(PublisherCode) + product number )")]
        public string ProductCode { get; set; }
        [Required(ErrorMessage = "CategoryCode  is required.....")]
        [StringLength(2, MinimumLength = 2, ErrorMessage = "Product must have 2 character (Ex: B1")]
        public string CategoryCode { get; set; }
        [Required(ErrorMessage = "PublisherCode  is required.....")]
        [StringLength(3, MinimumLength = 3, ErrorMessage = "CategoryCode must have 3 character (Ex: KD0")]
        public string PublisherCode { get; set; }

        [Required(ErrorMessage = "ProductName is required.....")]
        [StringLength(150, MinimumLength = 2, ErrorMessage = "ProductName must between 2 and 150 character")]
        public string ProductName { get; set; }
        [Required(ErrorMessage = "Price is required.....")]
        [Range(1, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double Price { get; set; }
        [Required(ErrorMessage = "Quantity is required.....")]
        [Range(0, int.MaxValue, ErrorMessage = "Please enter a value bigger than {0}")]
        public int Quantity { get; set; }
        [StringLength(150, MinimumLength = 1, ErrorMessage = "AuthorName must  between 2 and 150 character")]
        public string AuthorName { get; set; }

        [StringLength(4, MinimumLength = 4, ErrorMessage = "ReleaseYear must have 4 numeric characters (Ex: 2020)")]
        public string ReleaseYear { get; set; }

        [StringLength(1000, MinimumLength = 0, ErrorMessage = "Review max 1000 characters")]
        public string Review { get; set; }

        [Range(0, 10, ErrorMessage = "Please enter a value between 1 and 10")]
        public double Ver { get; set; }

        public bool Used { get; set; }

        public string Picture { get; set; }
        public DateTime CreateAt { get; set; }
    }
}
