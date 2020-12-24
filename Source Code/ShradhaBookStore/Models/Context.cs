using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
namespace ShradhaBookStore.Models
{
    public class Context : DbContext
    {
        public Context(DbContextOptions options) : base(options) { }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<Product> Product { get; set; }
        public DbSet<Cart> Cart { get; set; }
        public DbSet<Order> Order { get; set; }
        public DbSet<Testing> Test { get; set; }
        public DbSet<UserInfo> UserInfo { get; set; }
        public DbSet<Shipping> Shipping { get; set; }
    }

}

