using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HolidayMaker_API.Models;

namespace HolidayMaker_API.Services
{
    public class BookingService
    {
        private readonly HolidayMakerContext _holidayMakerContext;

        public BookingService(HolidayMakerContext holidayMakerContext)
        {
            _holidayMakerContext = holidayMakerContext;
        }
        
        public IEnumerable<Booking> GetBookingByCustomerId(int id)
        {
            return _holidayMakerContext.Bookings.Where(b => b.CustomerId == id).AsEnumerable();
        }

        public void CreateBooking(Booking booking)
        {
            _holidayMakerContext.Bookings.Add(booking);
            _holidayMakerContext.SaveChanges();
        }

        public async Task<int> EditBooking(Booking booking)
        {
            _holidayMakerContext.Update(booking);
            return await _holidayMakerContext.SaveChangesAsync();
        }
    }



    
    // skapa en bokning
    // hitta en/flera bokning med customer id
    // ändra bokning
}
