namespace TekioBackend.AppConfig
{
    public partial class AppConfigData
    {
        public Guid Id { get; set; }
        public string? AppName { get; set; }
        public string? MainColor { get; set; }
        public List<string>? SupportedLocales { get; set; }
    }
}
