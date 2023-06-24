using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace TaxCalulator.Migrations
{
    public partial class CreateLastTablesAndHitories : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "NonTaxableMonths",
                columns: table => new
                {
                    YearDef = table.Column<int>(type: "int", nullable: false),
                    MonthDef = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NonTaxableMonths", x => new { x.YearDef, x.MonthDef });
                });

            migrationBuilder.CreateTable(
                name: "VehicleTravelRecords",
                columns: table => new
                {
                    TravelRecordID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TravelDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    TravelTime = table.Column<TimeSpan>(type: "time", nullable: false),
                    VehicleID = table.Column<int>(type: "int", nullable: false),
                    CityID = table.Column<int>(type: "int", nullable: false),
                    AmountTax = table.Column<decimal>(type: "decimal(18,2)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VehicleTravelRecords", x => x.TravelRecordID);
                    table.ForeignKey(
                        name: "FK_VehicleTravelRecords_Cities_CityID",
                        column: x => x.CityID,
                        principalTable: "Cities",
                        principalColumn: "CityId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_VehicleTravelRecords_Vehicles_VehicleID",
                        column: x => x.VehicleID,
                        principalTable: "Vehicles",
                        principalColumn: "VehicleID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "WeekdayTaxs",
                columns: table => new
                {
                    WeekdayTaxId = table.Column<int>(type: "int", nullable: false),
                    DayOfWeek = table.Column<int>(type: "int", nullable: false),
                    HasTax = table.Column<bool>(type: "bit", nullable: false),
                    WeekdayTaxYear = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WeekdayTaxs", x => x.WeekdayTaxId);
                });

            migrationBuilder.CreateTable(
                name: "YearHolidays",
                columns: table => new
                {
                    YearHolidayID = table.Column<int>(type: "int", nullable: false),
                    YearHolidaysDay = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_YearHolidays", x => x.YearHolidayID);
                });

            migrationBuilder.InsertData(
                table: "NonTaxableMonths",
                columns: new[] { "MonthDef", "YearDef" },
                values: new object[] { 7, 2013 });

            migrationBuilder.InsertData(
                table: "WeekdayTaxs",
                columns: new[] { "WeekdayTaxId", "DayOfWeek", "HasTax", "WeekdayTaxYear" },
                values: new object[,]
                {
                    { 1, 1, true, 2013 },
                    { 2, 2, true, 2013 },
                    { 3, 3, true, 2013 },
                    { 4, 4, true, 2013 },
                    { 5, 5, true, 2013 },
                    { 6, 6, false, 2013 },
                    { 7, 0, false, 2013 }
                });

            migrationBuilder.InsertData(
                table: "YearHolidays",
                columns: new[] { "YearHolidayID", "YearHolidaysDay" },
                values: new object[,]
                {
                    { 8, new DateTime(2013, 9, 24, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 7, new DateTime(2013, 8, 28, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 6, new DateTime(2013, 6, 25, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 5, new DateTime(2013, 5, 22, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 1, new DateTime(2013, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 3, new DateTime(2013, 3, 12, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 2, new DateTime(2013, 2, 5, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 9, new DateTime(2013, 10, 29, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 4, new DateTime(2013, 4, 16, 0, 0, 0, 0, DateTimeKind.Unspecified) },
                    { 10, new DateTime(2013, 11, 26, 0, 0, 0, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.CreateIndex(
                name: "IX_VehicleTravelRecords_CityID",
                table: "VehicleTravelRecords",
                column: "CityID");

            migrationBuilder.CreateIndex(
                name: "IX_VehicleTravelRecords_VehicleID",
                table: "VehicleTravelRecords",
                column: "VehicleID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "NonTaxableMonths");

            migrationBuilder.DropTable(
                name: "VehicleTravelRecords");

            migrationBuilder.DropTable(
                name: "WeekdayTaxs");

            migrationBuilder.DropTable(
                name: "YearHolidays");
        }
    }
}
