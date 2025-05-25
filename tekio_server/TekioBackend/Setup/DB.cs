using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using TekioBackend.AppConfig;

namespace TekioBackend.Setup;

public class DB : IdentityDbContext<IdentityUser>
{
    public DB(DbContextOptions<DB> options)
        : base(options) { }

    public DbSet<AppConfigData> AppConfigData { get; set; }
}
