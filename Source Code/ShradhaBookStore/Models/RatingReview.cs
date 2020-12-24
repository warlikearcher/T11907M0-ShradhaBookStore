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
    public class RatingReview
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        [Required]
        public string ProductCode { get; set; }
        [Required]
        public int UserId { get; set; }
        public int Rate { get; set; }
        public string Context { get; set; }
        public DateTime CreateAt { get; set; }
    }
}
