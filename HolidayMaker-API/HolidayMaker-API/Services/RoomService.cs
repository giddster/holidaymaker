using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HolidayMaker_API.Models;
using Microsoft.EntityFrameworkCore;

namespace HolidayMaker_API.Services
{
    public class RoomService
    {


        private readonly HolidayMakerContext _holidayMakerContext;
      

        public RoomService(HolidayMakerContext holidayMakerContext)
        {
            _holidayMakerContext = holidayMakerContext;
           
        }
        public async Task<IEnumerable<Room>> GetAvailableRoomsByDestinationId(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla rum som inte är bokade FUNKAR 100%
            var availableRooms = await _holidayMakerContext.Rooms.Where(r => r.Hotel.Destination.Id == destinationId).Where(x => !x.BookingXrooms.Any(b =>
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                          ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))).ToListAsync();

            return availableRooms;
        }

        public async Task<IEnumerable<Room>> GetAvailableRoomsByHotelId(int hotelId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla rum som inte är bokade FUNKAR 100%
            var availableRooms = await _holidayMakerContext.Rooms.Where(r => r.Hotel.Id == hotelId).Where(x => !x.BookingXrooms.Any(b =>
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                          ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))).ToListAsync();

            return availableRooms;
        }


        public async Task<IEnumerable<Room>> GetAvailableRoomsByHotelName(string hotelName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Returnerar alla rum som inte är bokade FUNKAR 100%
            var availableRooms = await _holidayMakerContext.Rooms.Where(r => r.Hotel.Name.ToLower() == hotelName.ToLower()).Where(x => !x.BookingXrooms.Any(b =>
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                          ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))).ToListAsync();

            return availableRooms;
        }
    }
}
