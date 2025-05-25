using TekioBackend.Setup;

WebApplicationBuilder builder = WebApplication.CreateBuilder(args);

builder.Services.AddOpenApi();

Services.AppServices(builder);

WebApplication app = builder.Build();

Remote.AppRemote(app);

app.Run();
