using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Entities
{
    public class YearHolidays
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int YearHolidayID { get; set; }
        public DateTime YearHolidaysDay { get; set; } //Just Date
    }
}
