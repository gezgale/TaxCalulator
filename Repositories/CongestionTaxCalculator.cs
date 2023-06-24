using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Interfaces;
using Microsoft.EntityFrameworkCore;
using TaxCalulator.AppDbContext;

namespace Repositories
{
    public class CongestionTaxCalculator : ICongestionTaxCalculator
    {
        /**
             * Calculate the total toll fee for one day
             *
             * @param vehicle - the vehicle
             * @param dates   - date and time of all passes on one day
             * @return - the total congestion tax for that day
             */

        private readonly ApplicationDbContext _AppDbContext;
        private List<Entities.VehicleType> VehicleTypesLst;

        public CongestionTaxCalculator(ApplicationDbContext appDbContext)
        {
            this._AppDbContext = appDbContext;
        }

        public async Task<List<VehicleViewClass>> GetTax(Entities.Vehicle vehicle, DateTime[] dates, int CityId)
        {
            List<VehicleViewClass> LstVehicleViewClass = new List<VehicleViewClass>();
            VehicleViewClass vehicleViewClassSingle;
            if (vehicle == null || dates.Length <= 0)
            {
                return LstVehicleViewClass;
            }

            int RowIdCounter = 0;
            foreach (var itm in dates)
            {
                Decimal TaxAmount = await GetTollFee(itm, vehicle, CityId);
                vehicleViewClassSingle = new VehicleViewClass() { RowID = ++RowIdCounter, DateOfTravel = itm, VehicleVID = vehicle.VehicleID, TaxAmount = TaxAmount };
                LstVehicleViewClass.Add(vehicleViewClassSingle);
            }

            return LstVehicleViewClass;
        }

        /// <summary>
        /// Checking for free toll Vehicle
        /// </summary>
        /// <param name="vehicle"></param>
        /// <returns></returns>
        private async Task<bool> IsTollFreeVehicle(Entities.Vehicle vehicle)
        {
            if (vehicle == null) return false;
            return await _AppDbContext.VehicleTypes.AnyAsync(n => n.VehicleTypeID == vehicle.VehicleTypeID && n.IsTollFree == true);
        }

        public async Task<Decimal> GetTollFee(DateTime date, Entities.Vehicle vehicle, int vCityId)
        {
            if (await IsTollFreeDate(date) || await IsTollFreeVehicle(vehicle))
            {
                return 0;
            }

            var congestionTaxHour = await _AppDbContext.CongestionTaxHours.Where
                (n => n.CityId == vCityId
            && (n.FromTimeOfCongestion.TimeOfDay <= date.TimeOfDay
            && n.ToTimeOfCongestion.TimeOfDay >= date.TimeOfDay)).ToListAsync();

            if (congestionTaxHour == null)
            {
                return 0;
            }
            else
            {
                try
                {
                    if (congestionTaxHour.Count > 0)
                    {
                        return congestionTaxHour.FirstOrDefault().Amount;
                    }
                    else
                    {
                        return 0;
                    }
                }
                catch
                {
                    return 0;
                }
            }
        }



        private async Task<Boolean> IsTollFreeDate(DateTime date)
        {
            int year = date.Year;
            int month = date.Month;
            int day = date.Day;

            //Toll Free Month
            var NoTollMonthSelect = await _AppDbContext.NonTaxableMonths.SingleOrDefaultAsync(n => n.YearDef == date.Year && n.MonthDef == date.Month);
            if (NoTollMonthSelect != null)
            {
                if (date.Month == NoTollMonthSelect.MonthDef)
                {
                    return true;
                }
            }

            //Toll Free Days
            var DayOffSelect = await _AppDbContext.WeekdayTaxs.Where(n => n.HasTax == false).ToListAsync();

            if (DayOffSelect != null)
            {
                return DayOffSelect.Any(n => n.DayOfWeek == date.DayOfWeek);
            }
            else
            {
                return false;
            }
        }

        private enum TollFreeVehicles
        {
            Motorcycle = 0,
            Tractor = 1,
            Emergency = 2,
            Diplomat = 3,
            Foreign = 4,
            Military = 5
        }
    }
}
