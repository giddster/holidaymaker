using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HolidayMaker_API.Models;
using Microsoft.EntityFrameworkCore;

namespace HolidayMaker_API.Services
{
    public class DestinationService
    {
        private readonly HolidayMakerContext _holidayMakerContext;

        public DestinationService(HolidayMakerContext holidayMakerContext)
        {
           _holidayMakerContext = holidayMakerContext;
        }

        public async Task<IEnumerable<Destination>> GetAllDestinations()
        {
            return await _holidayMakerContext.Destinations.ToListAsync();
        }

        public async Task<Destination> GetDestinationById(int id)
        {
            var destination = await _holidayMakerContext.Destinations.FindAsync(id);
            return destination;
        }
        public async Task<Destination> GetDestinationByName(string CityName, string countryName)
        {
            var destination = await _holidayMakerContext.Destinations.FirstOrDefaultAsync(d=> d.City.ToLower() == CityName.ToLower() || d.Country.ToLower() == countryName.ToLower() );
            return destination;
        }

        
    }
}
