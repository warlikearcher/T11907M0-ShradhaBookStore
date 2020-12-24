using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class Shippingorder
    {
        public Shipping shipping { get; set; }

        public Order order { get; set; }

        public OrderDetail detail { get; set; }

        public UserInfo user { get; set; }

        public Product product { get; set; }
    }
}
