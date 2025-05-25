using Microsoft.AspNetCore.Identity;

namespace TekioBackend.Setup;

public class Remote
{
    public static void AppRemote(WebApplication app)
    {
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Todo API V1");
            });
        }

        app.MapOpenApi();
        app.UseHttpsRedirection();
        app.UseAuthorization();
        app.MapIdentityApi<IdentityUser>();
        app.MapControllers();
    }
}
