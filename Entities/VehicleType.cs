using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities
{
    public class VehicleType
    {
        public VehicleType()
        {
            Vehicles = new HashSet<Entities.Vehicle>();
        }

        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int VehicleTypeID { get; set; }

        [Required(ErrorMessage = "The type name of the vehicle type is required.")]
        [StringLength(100, ErrorMessage = "The type name of the vehicle must be less than 100 characters.")]
        public String VehicleTypeName { get; set; } // The type name of the vehicle
        
        [Required(ErrorMessage = "The type toll state of the vehicle type is required.")]
        public Boolean IsTollFree { get; set; } // The Toll State

        // Represents a collection of Vehicle entities
        public ICollection<Entities.Vehicle> Vehicles { get; set; }
    }
}
