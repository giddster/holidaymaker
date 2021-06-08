using HolidayMaker_API.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HolidayMaker_API.Services
{
    public class FavoriteHotelsService
    {
        private readonly HolidayMakerContext _holidayMakerContext;

        public FavoriteHotelsService(HolidayMakerContext holidayMakerContext)
        {
            this._holidayMakerContext = holidayMakerContext;
        }

        public async Task<List<FavoriteHotel>> GetFavoriteHotelByUserId(int id)
        {
            return await _holidayMakerContext.FavoriteHotels.Where(fh => fh.CustomerId == id).Include(h => h.Hotel).ToListAsync();
        }
    }
}
