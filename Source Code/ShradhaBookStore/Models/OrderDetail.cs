using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ShradhaBookStore.Models
{
    public class OrderDetail
    {
        public int OrderDetailId { get; set; }
        public int OrderNo { get; set; }
        public string ProductCode { get; set; }
        public int Amount { get; set; }
        public int UserID { get; set; }
        public double Price { get; set; }

        public string order_number { get; set; }
        //public virtual Product Product { get; set; }
        //public virtual Order Order { get; set; }

    }
}
