using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class Province
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int ProvinceId { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public string Name { get; set; }

        public int CountryId { get; set; }

        [Required(ErrorMessage = "The Country field is required.")]
        public Country Country { get; set; }

        public ICollection<City> Cities { get; set; }
    }

}
