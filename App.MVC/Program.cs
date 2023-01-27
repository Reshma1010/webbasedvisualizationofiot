using App.DAL.DBContext;
using App.DAL.Models;
using App.MVC.Services.BeaconService;
using App.MVC.Services.DoorService;
using App.MVC.Services.FloorService;
using App.MVC.Services.QuasiService;
using System.Reflection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddMvc().AddRazorRuntimeCompilation();
builder.Services.AddAutoMapper(Assembly.GetExecutingAssembly());
builder.Services.AddSingleton<MiddlewareContext>();
builder.Services.AddSingleton<FloorService>();
builder.Services.AddSingleton<DoorService>();
builder.Services.AddSingleton<BeaconService>();
builder.Services.AddSingleton<QuasiService>();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}
//app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Quasi}/{action=QuasiData}/{id?}");

app.Run();
