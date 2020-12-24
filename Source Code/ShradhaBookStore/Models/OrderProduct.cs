using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class OrderProduct
    {
        public Cart Cart { get; set; }
        public Product product { get; set; }
    }
} 
