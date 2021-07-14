using System;
using System.ComponentModel.DataAnnotations;

namespace ASPMVCLIVESESSION.MODEL
{
    public class Student
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage ="Please enter name")]
        [MinLength(2,ErrorMessage ="Please provide atleast two charcter")]
        public string Name { get; set; }
        [Required(ErrorMessage = "Please enter name")]
        public string Email { get; set; }
        public string Address { get; set; }
        public DateTime DOB { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
    }
}
