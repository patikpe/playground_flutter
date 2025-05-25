using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace TekioBackend.Migrations
{
    /// <inheritdoc />
    public partial class MoreSimpleModel : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "supportedLocales",
                table: "AppConfigData",
                newName: "SupportedLocales");

            migrationBuilder.RenameColumn(
                name: "mainColor",
                table: "AppConfigData",
                newName: "MainColor");

            migrationBuilder.RenameColumn(
                name: "appName",
                table: "AppConfigData",
                newName: "AppName");

            migrationBuilder.AlterColumn<List<string>>(
                name: "SupportedLocales",
                table: "AppConfigData",
                type: "text[]",
                nullable: true,
                oldClrType: typeof(List<string>),
                oldType: "text[]");

            migrationBuilder.AlterColumn<string>(
                name: "MainColor",
                table: "AppConfigData",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AlterColumn<string>(
                name: "AppName",
                table: "AppConfigData",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AddColumn<Guid>(
                name: "Id",
                table: "AppConfigData",
                type: "uuid",
                nullable: false,
                defaultValue: new Guid("00000000-0000-0000-0000-000000000000"));

            migrationBuilder.AddPrimaryKey(
                name: "PK_AppConfigData",
                table: "AppConfigData",
                column: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_AppConfigData",
                table: "AppConfigData");

            migrationBuilder.DropColumn(
                name: "Id",
                table: "AppConfigData");

            migrationBuilder.RenameColumn(
                name: "SupportedLocales",
                table: "AppConfigData",
                newName: "supportedLocales");

            migrationBuilder.RenameColumn(
                name: "MainColor",
                table: "AppConfigData",
                newName: "mainColor");

            migrationBuilder.RenameColumn(
                name: "AppName",
                table: "AppConfigData",
                newName: "appName");

            migrationBuilder.AlterColumn<List<string>>(
                name: "supportedLocales",
                table: "AppConfigData",
                type: "text[]",
                nullable: false,
                oldClrType: typeof(List<string>),
                oldType: "text[]",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "mainColor",
                table: "AppConfigData",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "appName",
                table: "AppConfigData",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);
        }
    }
}
