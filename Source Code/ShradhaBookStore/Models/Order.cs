using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class Order
    {

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int OrderNo { get; set; }
        public string Fullname { get { return string.Concat(FirstName + "" + LastName); } }
        [Required(ErrorMessage = "Please enter your first name")]
        [Display(Name = "First name")]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "Please enter your last name")]
        [Display(Name = "Last name")]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [StringLength(50)]
        public string LastName { get; set; }

        [Required(ErrorMessage = "Please enter your address")]
        [StringLength(100)]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [Display(Name = "Address Line 1")]
        public string AddressLine1 { get; set; }

        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [Display(Name = "Address Line 2")]
        public string AddressLine2 { get; set; }

        [Required(ErrorMessage = "Please enter your zip code")]
        [Display(Name = "Zip code")]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [StringLength(10, MinimumLength = 4)]
        public string ZipCode { get; set; }

        [Required]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [StringLength(10)]
        public string State { get; set; }

        [Required(ErrorMessage = "Please enter your country")]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [StringLength(50)]
        public string Country { get; set; }

        [Required(ErrorMessage = "Please enter your phone number")]
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        [StringLength(11)]
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Phone number")]
        public string PhoneNumber { get; set; }

        [Required]
        [StringLength(50)]
        [DataType(DataType.EmailAddress)]
        [RegularExpression(@"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|""(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*"")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])",
            ErrorMessage = "The email address is not entered in a correct format")]
        public string Email { get; set; }

        //[ScaffoldColumn(false)]
        public DateTime OrderPlaced { get; set; }

        public double Fee { get; set; }
        //Not null
        public string From { get; set; }
        //Not null
        public string To { get; set; }
        //Null
        [RegularExpression(@"^[\S]*$", ErrorMessage = "White space found")]
        public string note { get; set; }
        //Null
        public string ordertype { get; set; }
        //Null
        public string Status { get; set; }
    }
}
