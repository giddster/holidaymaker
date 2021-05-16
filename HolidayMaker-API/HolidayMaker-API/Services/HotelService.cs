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
        private readonly RoomService _rs;

        public HotelService(HolidayMakerContext holidayMakerContext, RoomService roomService)
        {
            _holidayMakerContext = holidayMakerContext;
            _rs = roomService;
        }

        public async Task<IEnumerable<Hotel>> GetAllHotelsByDestination(int id)
        {
            return await _holidayMakerContext.Hotels.Where(h => h.DestinationId == id).ToListAsync();
        }
        

        public async Task<IEnumerable<Hotel>> GetAvailableHotelsByDestinationId(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla lediga hotel FUNKAR 100%
            var availableHotels = await _holidayMakerContext.Hotels.Where(d => d.DestinationId == destinationId).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate))))).ToListAsync();

            return availableHotels;
        }

        public async Task<IEnumerable<Hotel>> GetAvailableHotelsByCityName(string cityName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla lediga hotel FUNKAR 100%
            var availableHotels = await _holidayMakerContext.Hotels.Where(d => d.Destination.City.ToLower() == cityName.ToLower()).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate))))).ToListAsync();

            return availableHotels;
        }

        public async Task<IEnumerable<Hotel>> GetAvailableHotelsByCountryName(string countryName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla lediga hotel FUNKAR 100%
            var availableHotels = await _holidayMakerContext.Hotels.Where(d => d.Destination.Country.ToLower() == countryName.ToLower()).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate))))).ToListAsync();

            return availableHotels;
        }



    }
}
