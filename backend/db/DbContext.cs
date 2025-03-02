using MySql.Data.MySqlClient;
using Questions.Models;
using QuestSavePintDb.Models;
using System;

namespace User.Data
{

  public class Program
  {
    public static void Main(string[] args)
        => CreateHostBuilder(args).Build().Run();

    // EF Core uses this method at design time to access the DbContext
    public static IHostBuilder CreateHostBuilder(string[] args)
        => Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(
                webBuilder => webBuilder.UseStartup<Startup>());
  }

  public class Startup
  {
    public void ConfigureServices(IServiceCollection services)
        => services.AddDbContext<ApplicationDbContext>();

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
    }
  }
  public class ApplicationDbContext : DbContext
  {
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
    {
    }

    public DbSet<UserModel> Users { get; set; }
    public DbSet<QuestionsModel> Questions { get; set; }

    public DbSet<QuestSavePintDbModel> Points { get; set; }
  }
}
