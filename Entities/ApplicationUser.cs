using Microsoft.AspNetCore.Identity;
using System;
using System.ComponentModel.DataAnnotations;

namespace Entities
{
    public class ApplicationUser : IdentityUser
    {
        [Display(Name = "Name"), Required(ErrorMessage = "Please Enter Then Name."), MinLength(2, ErrorMessage = "Min Len Is 2 Characters."), MaxLength(150, ErrorMessage = "Max Len is 150 Charactes")]
        public String FirstName { get; set; }
        [Display(Name = "Last Name"), Required(ErrorMessage = "Please Enter Then Last Name."), MinLength(2, ErrorMessage = "Min Len Is 2 Characters."), MaxLength(150, ErrorMessage = "Max Len is 150 Charactes")]
        public String LastName { get; set; }
        [Display(Name = "Mobile Phone"), MaxLength(20, ErrorMessage = "Max Len is 20 Charactes.")]
        public string MobilePhoneNumber { get; set; }
    }
}