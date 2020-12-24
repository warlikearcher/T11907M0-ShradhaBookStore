using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class Shipping
    {
        public int id { get; set; }
        public bool Delivering { get; set; }
        public bool Delivered { get; set; }
        public int OrderNo { get; set; }
        public DateTime Delivered_date { get; set; }

    }
}
