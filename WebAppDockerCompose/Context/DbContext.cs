using Microsoft.EntityFrameworkCore;
using WebAppDockerCompose.Models;

namespace WebAppDockerCompose.Context
{
    public class AppDbContext  : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }
        public DbSet<Employee> Employees { get; set; }
    }
}
