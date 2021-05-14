using HolidayMaker_API.Services;
using HolidayMaker_API.Models;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;

namespace HolidayMaker_API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<HolidayMakerContext>(options =>
                options.UseSqlServer(
                    Configuration.GetConnectionString("HolidayMakerDB")));

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "HolidayMaker_API", Version = "v1" });
            });

            //services.AddScoped(typeof(BookingService));
            //services.AddScoped(typeof(CustomerService));
            //services.AddScoped(typeof(DestinationService));
            //services.AddScoped(typeof(FavoriteHotelsService));
            //services.AddScoped(typeof(FlightService));
            //services.AddScoped(typeof(HotelService));
            //services.AddScoped(typeof(ReviewsService));
            //services.AddScoped(typeof(RoomService));

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {



            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "HolidayMaker_API v1"));
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
