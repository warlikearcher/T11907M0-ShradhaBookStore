using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class Reply
    {
        public Reply()
        {
            ReplyAt = DateTime.Now;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [DisplayName("Reply ID")]
        public int ReplyID { get; set; }
        public int UserID { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", ErrorMessage = "Please enter the correct format")]
        public string MailTo { get; set; }
        public string ReplyTitle { get; set; }
        public string ReplyMessage { get; set; }

        public DateTime? ReplyAt { get; set; }
        //public int FeedBackID { get; set; }
    }
}
