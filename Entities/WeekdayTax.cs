using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class WeekdayTax
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int WeekdayTaxId { get; set; } // ID of the weekday tax

        [Required(ErrorMessage = "The DayOfWeek field is required.")]
        public DayOfWeek DayOfWeek { get; set; } // Day of the week

        [Required(ErrorMessage = "The HasTax field is required.")]
        public bool HasTax { get; set; } // Indicates whether the day has tax or not

        public int WeekdayTaxYear { get; set; } // 2013
    }
}
