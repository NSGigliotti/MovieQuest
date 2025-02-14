using Images.Routes;
using Microsoft.Extensions.FileProviders;
using Questions.Routes;
using User.Routes;

var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddScoped<TokenService>();
builder.Services.AddDbContext<ApplicationDbContext>(opitons =>
{
    opitons.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
});

// Add services to the container.
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();


app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(Path.Combine(Directory.GetCurrentDirectory())),
    RequestPath = "/Public"
});

app.UseRouting();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}



app.UserRoutes(connectionString);
app.QuestionsRoutes(connectionString);  
app.ImageRoutes();

app.UseHttpsRedirection();
app.Run();  
