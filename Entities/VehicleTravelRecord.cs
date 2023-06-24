using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class VehicleTravelRecord
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int TravelRecordID { get; set; }
        [Required(ErrorMessage = "The date of the travel record is required.")]
        public DateTime TravelDate { get; set; }
        [Required(ErrorMessage = "The time of the travel record is required.")]
        public TimeSpan TravelTime { get; set; }
        [Required(ErrorMessage = "The vehicle ID is required.")]
        public int VehicleID { get; set; }
        [Required(ErrorMessage = "The city of passage is required.")]
        public int CityID { get; set; }
        [Required(ErrorMessage = "The amount of tax is required.")]
        public decimal AmountTax { get; set; }
        public virtual Vehicle Vehicle { get; set; }
        public virtual City City { get; set; }
    }
}