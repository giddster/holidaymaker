using HolidayMaker_API.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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

        public async Task<IEnumerable<Hotel>> GetAllHotelImagesById(int id)
        {
            return await _holidayMakerContext.Hotels.Where(h => h.DestinationId == id)
                .Include(x => x.HotelImages)
                .ToListAsync();
        }



        public async Task<IEnumerable<Hotel>> GetHotelImagesByCityOrCountryName(string searchString)
        {
            return await _holidayMakerContext.Hotels.Where(h => h.Destination.City.ToLower() == searchString.ToLower() ||
                                                                     h.Destination.Country.ToLower() == searchString.ToLower())
                                                                     .Include(x => x.HotelImages)
                                                                     .ToListAsync();
        }


        public async Task<IEnumerable<Hotel>> GetHotelImagesByHotelName(string hotelName)
        {
            return await _holidayMakerContext.Hotels.Where(h => h.Name.ToLower() == hotelName.ToLower())
                                                                     .Include(x => x.HotelImages)
                                                                     .ToListAsync();
        }




        public async Task<IEnumerable<Hotel>> GetAllHotelsByDestination(int id)
        {
            return await _holidayMakerContext.Hotels.Where(h => h.DestinationId == id)
                .Include(x => x.Rooms)
                .ThenInclude(x => x.RoomType)
                .ThenInclude(y => y.Rooms)
                .ThenInclude(z => z.RoomImages)
                .ToListAsync();
        }


        public async Task<IEnumerable<Hotel>> GetAvailableHotelsByDestinationId(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla lediga hotel FUNKAR 100%
            var availableHotels = await _holidayMakerContext.Hotels.Where(d => d.DestinationId == destinationId).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))))
                .Include(x => x.Rooms)
                .ThenInclude(x => x.RoomType)
                .ThenInclude(y => y.Rooms)
                .ThenInclude(z => z.RoomImages)
                .ToListAsync();

            return availableHotels;
        }

        public async Task<List<Hotel>> GetAvailableHotelsByCityOrCountryName(string searchInput, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla lediga hotel FUNKAR 100%
            var availableHotels = await _holidayMakerContext.Hotels.Where(d => d.Destination.City.ToLower() == searchInput.ToLower() || d.Destination.Country.ToLower() == searchInput.ToLower()).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))))
                .Include(x => x.Rooms)
                .ThenInclude(x => x.RoomType)
                .ThenInclude(y => y.Rooms)
                .ThenInclude(z => z.RoomImages)
                .ToListAsync();

            return availableHotels;
        }

        public async Task<IEnumerable<Hotel>> GetAvailableHotelsByCityName(string searchInput, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla lediga hotel FUNKAR 100%
            var availableHotels = await _holidayMakerContext.Hotels.Where(d => d.Destination.City.ToLower() == searchInput.ToLower()).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))))
                .Include(x => x.Rooms)
                .ThenInclude(x => x.RoomType)
                .ThenInclude(y => y.Rooms)
                .ThenInclude(z => z.RoomImages)
                .ToListAsync();

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
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))))
                .Include(x => x.Rooms)
                .ThenInclude(x => x.RoomType)
                .ThenInclude(y => y.Rooms)
                .ThenInclude(z => z.RoomImages)
                .ToListAsync();

            return availableHotels;
        }



    }
}
