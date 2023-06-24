using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Interfaces
{
    public interface ICongestionTaxCalculator
    {
        Task<List<VehicleViewClass>> GetTax(Entities.Vehicle vehicle, DateTime[] dates, int CityId);
    }
}