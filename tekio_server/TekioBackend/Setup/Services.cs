using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

namespace TekioBackend.Setup;

public class Services
{
    public static void AppServices(WebApplicationBuilder builder)
    {
        builder.Services.AddControllers();
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddOpenApi();
        builder.Services.AddAuthorization();
        builder.Services.AddSwaggerGen(c =>
        {
            c.SwaggerDoc(
                "v1",
                new OpenApiInfo
                {
                    Title = "Todo API",
                    Description = "Keep track of your tasks",
                    Version = "v1",
                }
            );
        });

        builder.Services.AddDbContext<DB>(options =>
            options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection"))
        );

        builder.Services.AddIdentityApiEndpoints<IdentityUser>().AddEntityFrameworkStores<DB>();
    }
}
