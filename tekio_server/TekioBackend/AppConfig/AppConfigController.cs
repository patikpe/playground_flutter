using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using TekioBackend.Setup;

namespace TekioBackend.AppConfig
{
    [Route("v1/appconfig")]
    [ApiController]
    public class AppConfigController : ControllerBase
    {
        private readonly DB dbContext;

        private readonly Guid appConfigId = Guid.Parse("3fa85f64-5717-4562-b3fc-2c963f66afa6");

        public AppConfigController(DB dbContext)
        {
            this.dbContext = dbContext;
        }

        [HttpGet]
        public IActionResult GetAppConfig()
        {
            var appConfig = dbContext.AppConfigData.Find(appConfigId);

            return Ok(appConfig);
        }

        // This needs to be done directly on the database.
        // [HttpPost]
        // public IActionResult SetAppConfig([FromBody] AppConfigData appConfigData)
        // {
        //     dbContext.AppConfigData.Add(appConfigData);
        //     dbContext.SaveChanges();

        //     return Ok(appConfigData);
        // }

        [HttpPut]
        public IActionResult UpdateAppConfig([FromBody] AppConfigData appConfigData)
        {
            var existingAppConfig = dbContext.AppConfigData.Find(appConfigId);
            if (existingAppConfig == null)
            {
                return NotFound("AppConfig not found.");
            }

            existingAppConfig.AppName = appConfigData.AppName;
            existingAppConfig.MainColor = appConfigData.MainColor;
            existingAppConfig.SupportedLocales = appConfigData.SupportedLocales;

            dbContext.SaveChanges();

            return Ok(appConfigData);
        }
    }
}
