using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class DetailsOrder
    {
        public Order order { get; set; }
        public OrderDetail orderDetail { get; set; }
        public Product product { get; set; }
    }
}
