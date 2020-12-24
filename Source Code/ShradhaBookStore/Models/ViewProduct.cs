using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class ViewProduct
    {
        public Product Product { get; set; }
        public Category Category { get; set; }
        public Publisher Publisher { get; set; }

        public UserInfo UserInfo { get; set; }
        public RatingReview RatingReview { get; set; }
    }
}