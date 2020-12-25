using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class FeedBack
    {
     
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int FeedBackID { get; set; }
        public int UserID { get; set; }
        
        public string FullName { get; set; }
        public string Email { get; set; }
        [Required(ErrorMessage = "Title is required")]
        public string Title { get; set; }
        [Required(ErrorMessage = "Messsage is required")]
        public string Message { get; set; }
       
        [DisplayName("Feedback Created At")]

        public DateTime? FeedBackAt { get; set; }
       
    }
}
