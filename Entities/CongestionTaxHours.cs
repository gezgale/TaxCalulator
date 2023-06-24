using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class CongestionTaxHours
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int CongestionTaxHoursID { get; set; }
        public String TimesInString { get; set; }// Like: "06:00–06:29"
        public DateTime FromTimeOfCongestion { get; set; } // Start time range for congestion tax
        public DateTime ToTimeOfCongestion { get; set; } // End Time for congestion tax
        public Decimal Amount { get; set; } // Amount in SEK
        public int CityId { get; set; }
        public virtual City City { get; set; } //Tax for the desired city
    }
}