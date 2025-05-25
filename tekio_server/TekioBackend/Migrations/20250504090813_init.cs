using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TekioBackend.Migrations
{
    /// <inheritdoc />
    public partial class init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AppConfigData",
                columns: table => new
                {
                    appName = table.Column<string>(type: "text", nullable: false),
                    mainColor = table.Column<string>(type: "text", nullable: false),
                    supportedLocales = table.Column<List<string>>(type: "text[]", nullable: false)
                },
                constraints: table =>
                {
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AppConfigData");
        }
    }
}
