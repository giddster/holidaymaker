using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HolidayMaker_API.Models;
using Microsoft.EntityFrameworkCore;

namespace HolidayMaker_API.Services
{
    public class HotelService
    {
        private readonly HolidayMakerContext _holidayMakerContext;

        public HotelService(HolidayMakerContext holidayMakerContext)
        {
            _holidayMakerContext = holidayMakerContext;
        }

        public async Task<IEnumerable<Hotel>> GetAllHotelsByDestination(int id)
        {
            return await _holidayMakerContext.Hotels.Where(h => h.DestinationId == id).ToListAsync();
        }


    }
}
