using System.ComponentModel.DataAnnotations;

namespace WebAppDockerCompose.Models
{
    public class Employee
    {
        public int Id { get; set; }
        [Required, MaxLength(20)]
        public string Name { get; set; }
    }
}
