using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class Vehicle
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int VehicleID { get; set; }

        [Required(ErrorMessage = "The name of the vehicle is required.")]
        [StringLength(100, ErrorMessage = "The name of the vehicle must be less than 100 characters.")]
        public String VehicleName { get; set; } // The name of the vehicle

        [Required(ErrorMessage = "The type of the vehicle is required.")]
        public int VehicleTypeID { get; set; }

        [Required(ErrorMessage = "The model of the vehicle is required.")]
        [StringLength(150, ErrorMessage = "The model of the vehicle must be less than 150 characters.")]
        public String Model { get; set; } // The specific model of the vehicle

        [Range(1900, 2022, ErrorMessage = "Please enter a valid year between 1900 and 2022.")]
        public int YearModel { get; set; } // The year in which the vehicle was manufactured

        [Required(ErrorMessage = "The license plate information of the vehicle is required.")]
        [StringLength(150, ErrorMessage = "The license plate information of the vehicle must be less than 150 characters.")]
        public String LicensePlate { get; set; } // The license plate info

        public virtual VehicleType VehicleType { get; set; }
    }
}