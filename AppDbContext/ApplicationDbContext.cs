using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace TaxCalulator.AppDbContext
{
    public class ApplicationDbContext : IdentityDbContext<Entities.ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        // Represents a collection of vehicles in the database.
        public DbSet<Entities.Vehicle> Vehicles { get; set; }
        // Represents a collection of vehicle travel records in the database.
        public DbSet<Entities.VehicleTravelRecord> VehicleTravelRecords { get; set; }
        // Represents a collection of vehicle types in the database.
        public DbSet<Entities.VehicleType> VehicleTypes { get; set; }
        // Represents a collection of countries in the database.
        public DbSet<Entities.Country> Countries { get; set; }
        // Represents a collection of provinces in the database.
        public DbSet<Entities.Province> Provinces { get; set; }
        // Represents a collection of cities in the database.
        public DbSet<Entities.City> Cities { get; set; }
        // Represents a collection of non-taxable months in the database.
        public DbSet<Entities.NonTaxableMonth> NonTaxableMonths { get; set; }
        // Represents a collection of year holidays in the database.
        public DbSet<Entities.YearHolidays> YearHolidays { get; set; }
        // Represents a collection of congestion tax hours in the database.
        public DbSet<Entities.CongestionTaxHours> CongestionTaxHours { get; set; }
        // Represents a collection of weekday taxes in the database.
        public DbSet<Entities.WeekdayTax> WeekdayTaxs { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Define the one-to-many relationship between VehicleType and Vehicle
            modelBuilder.Entity<Entities.Vehicle>()
                .HasOne(v => v.VehicleType)
                .WithMany(vt => vt.Vehicles)
                .HasForeignKey(v => v.VehicleTypeID)
                .OnDelete(DeleteBehavior.Cascade);

            // Define the primary key for VehicleType
            modelBuilder.Entity<Entities.VehicleType>()
                .HasKey(vt => vt.VehicleTypeID);

            modelBuilder.Entity<Entities.Country>()
    .HasMany(c => c.Provinces) // A country can have multiple provinces
    .WithOne(p => p.Country) // Each province belongs to one country
    .HasForeignKey(p => p.CountryId) // Foreign key CountryId in the provinces table
    .IsRequired(); // Country is required for a province

            modelBuilder.Entity<Entities.Province>()
                .HasMany(p => p.Cities) // A province can have multiple cities
                .WithOne(c => c.Province) // Each city belongs to one province
                .HasForeignKey(c => c.ProvinceId) // Foreign key ProvinceId in the cities table
                .IsRequired(); // Province is required for a city

            // Configure the relationship between CongestionTaxHours and City
            modelBuilder.Entity<Entities.CongestionTaxHours>()
            .HasOne(c => c.City) // CongestionTaxHours has a reference to a City
            .WithMany() // City has multiple CongestionTaxHours
            .HasForeignKey(c => c.CityId); // Foreign key CityId in the CongestionTaxHours table

            // Configure the relationship between VehicleTravelRecord and Vehicle
            modelBuilder.Entity<Entities.VehicleTravelRecord>()
                .HasOne(vtr => vtr.Vehicle)
                .WithMany()
                .HasForeignKey(vtr => vtr.VehicleID)
                .IsRequired();

            // Configure the relationship between VehicleTravelRecord and City
            modelBuilder.Entity<Entities.VehicleTravelRecord>()
                .HasOne(vtr => vtr.City)
                .WithMany()
                .HasForeignKey(vtr => vtr.CityID)
                .IsRequired();

            modelBuilder.Entity<Entities.NonTaxableMonth>()
        .HasKey(n => new { n.YearDef, n.MonthDef })
        .HasAnnotation("SqlServer:ErrorNumber", 2601)// Duplicate Record Error Number
        .HasAnnotation("SqlServer:ErrorMessage", "The combination of YearDef and MonthDef must be unique.");


            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 0, VehicleTypeName = "Motorcycle", IsTollFree = true });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 1, VehicleTypeName = "Tractor", IsTollFree = true });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 2, VehicleTypeName = "Emergency", IsTollFree = true });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 3, VehicleTypeName = "Diplomat", IsTollFree = true });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 4, VehicleTypeName = "Foreign", IsTollFree = true });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 5, VehicleTypeName = "Military", IsTollFree = true });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 6, VehicleTypeName = "Sedan", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 7, VehicleTypeName = "SUV", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 8, VehicleTypeName = "Hatchback", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 9, VehicleTypeName = "Convertible", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 10, VehicleTypeName = "Coupe", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 11, VehicleTypeName = "Minivan", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 12, VehicleTypeName = "Pickup Truck", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 13, VehicleTypeName = "Electric", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 14, VehicleTypeName = "Hybrid", IsTollFree = false });
            modelBuilder.Entity<Entities.VehicleType>().HasData(new Entities.VehicleType() { VehicleTypeID = 15, VehicleTypeName = "Luxury", IsTollFree = false });

            modelBuilder.Entity<Entities.Country>().HasData(new Entities.Country() { CountryId = 1, Name = "Sweden", Provinces = null });
            modelBuilder.Entity<Entities.Province>().HasData(new Entities.Province() { ProvinceId = 1, CountryId = 1, Name = "Västra Götaland", Cities = null, Country = null });
            modelBuilder.Entity<Entities.City>().HasData(new Entities.City() { CityId = 1, ProvinceId = 1, Name = "Gothenburg" , Province = null });

            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 1, TimesInString = "06:00–06:29" , FromTimeOfCongestion = DateTime.Parse("06:00:00"), ToTimeOfCongestion = DateTime.Parse("06:29:59"), Amount = 8, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 2, TimesInString = "06:30–06:59", FromTimeOfCongestion = DateTime.Parse("06:30:00"), ToTimeOfCongestion = DateTime.Parse("06:59:59"), Amount = 13, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 3, TimesInString = "07:00–07:59", FromTimeOfCongestion = DateTime.Parse("07:00:00"), ToTimeOfCongestion = DateTime.Parse("07:59:59"), Amount = 18, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 4, TimesInString = "08:00–08:29", FromTimeOfCongestion = DateTime.Parse("08:00:00"), ToTimeOfCongestion = DateTime.Parse("08:29:59"), Amount = 13, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 5, TimesInString = "08:30–14:59", FromTimeOfCongestion = DateTime.Parse("08:30:00"), ToTimeOfCongestion = DateTime.Parse("14:59:59"), Amount = 8, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 6, TimesInString = "15:00–15:29", FromTimeOfCongestion = DateTime.Parse("15:00:00"), ToTimeOfCongestion = DateTime.Parse("15:29:59"), Amount = 13, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 7, TimesInString = "15:30–16:59", FromTimeOfCongestion = DateTime.Parse("15:30:00"), ToTimeOfCongestion = DateTime.Parse("16:59:59"), Amount = 18, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 8, TimesInString = "17:00–17:59", FromTimeOfCongestion = DateTime.Parse("17:00:00"), ToTimeOfCongestion = DateTime.Parse("17:59:59"), Amount = 13, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 9, TimesInString = "18:00–18:29", FromTimeOfCongestion = DateTime.Parse("18:00:00"), ToTimeOfCongestion = DateTime.Parse("18:29:59"), Amount = 8, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 10, TimesInString = "18:30–05:59", FromTimeOfCongestion = DateTime.Parse("18:30:00"), ToTimeOfCongestion = DateTime.Parse("23:59:59"), Amount = 0, CityId = 1, City = null });
            modelBuilder.Entity<Entities.CongestionTaxHours>().HasData(new Entities.CongestionTaxHours() { CongestionTaxHoursID = 11, TimesInString = "18:30–05:59", FromTimeOfCongestion = DateTime.Parse("00:00:00"), ToTimeOfCongestion = DateTime.Parse("05:59:59"), Amount = 0, CityId = 1, City = null });

            //July 2013
            modelBuilder.Entity<Entities.NonTaxableMonth>().HasData(new Entities.NonTaxableMonth() { YearDef = 2013, MonthDef = 7  });

            //Holidays Except Saturdays And Sundays
            modelBuilder.Entity<Entities.YearHolidays>().HasData(
    new Entities.YearHolidays() { YearHolidayID = 1, YearHolidaysDay = DateTime.Parse("2013/01/01 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 2, YearHolidaysDay = DateTime.Parse("2013/02/05 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 3, YearHolidaysDay = DateTime.Parse("2013/03/12 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 4, YearHolidaysDay = DateTime.Parse("2013/04/16 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 5, YearHolidaysDay = DateTime.Parse("2013/05/22 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 6, YearHolidaysDay = DateTime.Parse("2013/06/25 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 7, YearHolidaysDay = DateTime.Parse("2013/08/28 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 8, YearHolidaysDay = DateTime.Parse("2013/09/24 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 9, YearHolidaysDay = DateTime.Parse("2013/10/29 00:00:00") },
    new Entities.YearHolidays() { YearHolidayID = 10, YearHolidaysDay = DateTime.Parse("2013/11/26 00:00:00") }
);
            // Monday - Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 1, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Monday, HasTax = true });
            // Tuesday - Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 2, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Tuesday, HasTax = true });
            // Wednesday - Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 3, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Wednesday, HasTax = true });
            // Thursday - Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 4, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Thursday, HasTax = true });
            // Friday - Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 5, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Friday, HasTax = true });
            // Saturday - No Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 6, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Saturday, HasTax = false });
            // Sunday - No Tax
            modelBuilder.Entity<Entities.WeekdayTax>().HasData(new Entities.WeekdayTax() { WeekdayTaxId = 7, WeekdayTaxYear = 2013, DayOfWeek = DayOfWeek.Sunday, HasTax = false });

            base.OnModelCreating(modelBuilder);
        }
    }
}