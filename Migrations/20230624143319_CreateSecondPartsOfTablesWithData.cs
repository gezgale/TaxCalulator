using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace TaxCalulator.Migrations
{
    public partial class CreateSecondPartsOfTablesWithData : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Countries",
                columns: table => new
                {
                    CountryId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Countries", x => x.CountryId);
                });

            migrationBuilder.CreateTable(
                name: "VehicleTypes",
                columns: table => new
                {
                    VehicleTypeID = table.Column<int>(type: "int", nullable: false),
                    VehicleTypeName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    IsTollFree = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_VehicleTypes", x => x.VehicleTypeID);
                });

            migrationBuilder.CreateTable(
                name: "Provinces",
                columns: table => new
                {
                    ProvinceId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CountryId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Provinces", x => x.ProvinceId);
                    table.ForeignKey(
                        name: "FK_Provinces_Countries_CountryId",
                        column: x => x.CountryId,
                        principalTable: "Countries",
                        principalColumn: "CountryId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Vehicles",
                columns: table => new
                {
                    VehicleID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    VehicleName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    VehicleTypeID = table.Column<int>(type: "int", nullable: false),
                    Model = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: false),
                    YearModel = table.Column<int>(type: "int", nullable: false),
                    LicensePlate = table.Column<string>(type: "nvarchar(150)", maxLength: 150, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Vehicles", x => x.VehicleID);
                    table.ForeignKey(
                        name: "FK_Vehicles_VehicleTypes_VehicleTypeID",
                        column: x => x.VehicleTypeID,
                        principalTable: "VehicleTypes",
                        principalColumn: "VehicleTypeID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Cities",
                columns: table => new
                {
                    CityId = table.Column<int>(type: "int", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: false),
                    ProvinceId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cities", x => x.CityId);
                    table.ForeignKey(
                        name: "FK_Cities_Provinces_ProvinceId",
                        column: x => x.ProvinceId,
                        principalTable: "Provinces",
                        principalColumn: "ProvinceId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "CongestionTaxHours",
                columns: table => new
                {
                    CongestionTaxHoursID = table.Column<int>(type: "int", nullable: false),
                    TimesInString = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FromTimeOfCongestion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    ToTimeOfCongestion = table.Column<DateTime>(type: "datetime2", nullable: false),
                    Amount = table.Column<decimal>(type: "decimal(18,2)", nullable: false),
                    CityId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CongestionTaxHours", x => x.CongestionTaxHoursID);
                    table.ForeignKey(
                        name: "FK_CongestionTaxHours_Cities_CityId",
                        column: x => x.CityId,
                        principalTable: "Cities",
                        principalColumn: "CityId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.InsertData(
                table: "Countries",
                columns: new[] { "CountryId", "Name" },
                values: new object[] { 1, "Sweden" });

            migrationBuilder.InsertData(
                table: "VehicleTypes",
                columns: new[] { "VehicleTypeID", "IsTollFree", "VehicleTypeName" },
                values: new object[,]
                {
                    { 13, false, "Electric" },
                    { 12, false, "Pickup Truck" },
                    { 11, false, "Minivan" },
                    { 10, false, "Coupe" },
                    { 9, false, "Convertible" },
                    { 8, false, "Hatchback" },
                    { 14, false, "Hybrid" },
                    { 7, false, "SUV" },
                    { 5, true, "Military" },
                    { 4, true, "Foreign" },
                    { 3, true, "Diplomat" },
                    { 2, true, "Emergency" },
                    { 1, true, "Tractor" },
                    { 0, true, "Motorcycle" },
                    { 6, false, "Sedan" },
                    { 15, false, "Luxury" }
                });

            migrationBuilder.InsertData(
                table: "Provinces",
                columns: new[] { "ProvinceId", "CountryId", "Name" },
                values: new object[] { 1, 1, "Västra Götaland" });

            migrationBuilder.InsertData(
                table: "Cities",
                columns: new[] { "CityId", "Name", "ProvinceId" },
                values: new object[] { 1, "Gothenburg", 1 });

            migrationBuilder.InsertData(
                table: "CongestionTaxHours",
                columns: new[] { "CongestionTaxHoursID", "Amount", "CityId", "FromTimeOfCongestion", "TimesInString", "ToTimeOfCongestion" },
                values: new object[,]
                {
                    { 1, 8m, 1, new DateTime(2023, 6, 24, 6, 0, 0, 0, DateTimeKind.Unspecified), "06:00–06:29", new DateTime(2023, 6, 24, 6, 29, 59, 0, DateTimeKind.Unspecified) },
                    { 2, 13m, 1, new DateTime(2023, 6, 24, 6, 30, 0, 0, DateTimeKind.Unspecified), "06:30–06:59", new DateTime(2023, 6, 24, 6, 59, 59, 0, DateTimeKind.Unspecified) },
                    { 3, 18m, 1, new DateTime(2023, 6, 24, 7, 0, 0, 0, DateTimeKind.Unspecified), "07:00–07:59", new DateTime(2023, 6, 24, 7, 59, 59, 0, DateTimeKind.Unspecified) },
                    { 4, 13m, 1, new DateTime(2023, 6, 24, 8, 0, 0, 0, DateTimeKind.Unspecified), "08:00–08:29", new DateTime(2023, 6, 24, 8, 29, 59, 0, DateTimeKind.Unspecified) },
                    { 5, 8m, 1, new DateTime(2023, 6, 24, 8, 30, 0, 0, DateTimeKind.Unspecified), "08:30–14:59", new DateTime(2023, 6, 24, 14, 59, 59, 0, DateTimeKind.Unspecified) },
                    { 6, 13m, 1, new DateTime(2023, 6, 24, 15, 0, 0, 0, DateTimeKind.Unspecified), "15:00–15:29", new DateTime(2023, 6, 24, 15, 29, 59, 0, DateTimeKind.Unspecified) },
                    { 7, 18m, 1, new DateTime(2023, 6, 24, 15, 30, 0, 0, DateTimeKind.Unspecified), "15:30–16:59", new DateTime(2023, 6, 24, 16, 59, 59, 0, DateTimeKind.Unspecified) },
                    { 8, 13m, 1, new DateTime(2023, 6, 24, 17, 0, 0, 0, DateTimeKind.Unspecified), "17:00–17:59", new DateTime(2023, 6, 24, 17, 59, 59, 0, DateTimeKind.Unspecified) },
                    { 9, 8m, 1, new DateTime(2023, 6, 24, 18, 0, 0, 0, DateTimeKind.Unspecified), "18:00–18:29", new DateTime(2023, 6, 24, 18, 29, 59, 0, DateTimeKind.Unspecified) },
                    { 10, 0m, 1, new DateTime(2023, 6, 24, 18, 30, 0, 0, DateTimeKind.Unspecified), "18:30–05:59", new DateTime(2023, 6, 24, 23, 59, 59, 0, DateTimeKind.Unspecified) },
                    { 11, 0m, 1, new DateTime(2023, 6, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), "18:30–05:59", new DateTime(2023, 6, 24, 5, 59, 59, 0, DateTimeKind.Unspecified) }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Cities_ProvinceId",
                table: "Cities",
                column: "ProvinceId");

            migrationBuilder.CreateIndex(
                name: "IX_CongestionTaxHours_CityId",
                table: "CongestionTaxHours",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_Provinces_CountryId",
                table: "Provinces",
                column: "CountryId");

            migrationBuilder.CreateIndex(
                name: "IX_Vehicles_VehicleTypeID",
                table: "Vehicles",
                column: "VehicleTypeID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CongestionTaxHours");

            migrationBuilder.DropTable(
                name: "Vehicles");

            migrationBuilder.DropTable(
                name: "Cities");

            migrationBuilder.DropTable(
                name: "VehicleTypes");

            migrationBuilder.DropTable(
                name: "Provinces");

            migrationBuilder.DropTable(
                name: "Countries");
        }
    }
}
