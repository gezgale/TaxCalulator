using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class City
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CityId { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        [StringLength(50, ErrorMessage = "The Name field cannot exceed 50 characters.")]
        public string Name { get; set; }

        public int ProvinceId { get; set; }

        [Required(ErrorMessage = "The Province field is required.")]
        public Province Province { get; set; }
    }
}
