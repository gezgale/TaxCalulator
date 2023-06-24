using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class Country
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CountryId { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        public string Name { get; set; }

        public ICollection<Province> Provinces { get; set; }
    }
}
