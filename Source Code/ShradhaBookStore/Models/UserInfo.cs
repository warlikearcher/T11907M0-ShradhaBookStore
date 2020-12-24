using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class UserInfo
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int UserID { get; set; }
        [Required(ErrorMessage = "Full Name is required")]
        public string FullName { get; set; }
        [Required(ErrorMessage = "User Name is required")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "PassWord must be from 5 to 50 charactor")]
        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 5, ErrorMessage = "PassWord must be from 5 to 50 charactor")]

        public string PassWord { get; set; }
        [NotMapped]
        [Required(ErrorMessage = "Comfirm PassWord is required")]
        [CompareAttribute("PassWord", ErrorMessage = "The confirm password and confirmation password do not match.")]
        public string ConfirmPassword { get; set; }
        [Required(ErrorMessage = "Email is required")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}", ErrorMessage = "Please enter the correct format")]

        public string Email { get; set; }

        [Required(ErrorMessage = "Phone is required")]
        public string Phone { get; set; }
        [Required(ErrorMessage = "Adress is required")]
        public string Adress { get; set; }
        public bool IsAdmin { get; set; }

        public bool Status { get; set; }
        public DateTime? CreateAt { get; set; }


    }
}
