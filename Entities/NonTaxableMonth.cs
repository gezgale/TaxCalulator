using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities
{
    public class NonTaxableMonth
    {
        public int YearDef { get; set; } // Year = 2013
        public int MonthDef { get; set; } // Month number (1-12) - NonTaxableMonth = 7 July
    }
}