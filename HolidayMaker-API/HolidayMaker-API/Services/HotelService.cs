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
        
        public async Task<IEnumerable<Hotel>> GetAllAvailableHotels(int destinationId,DateTime checkInDate, DateTime checkOutDate)
        {

            var hotels = await _holidayMakerContext.Hotels.Where(h => h.DestinationId == destinationId).ToListAsync();
            List<int> rooms = new List<int>();
            var allRooms = await _holidayMakerContext.Rooms.ToListAsync();
            rooms.AddRange(from hotel in hotels
                           from room in allRooms
                           where hotel.Id == room.HotelId
                           select room.Id);

            List<int> bookedRooms = new List<int>();
            var bookings = _holidayMakerContext.Bookings.Where(r => r.CheckInDate >= checkInDate &&
                                                                       r.CheckOutDate <= checkOutDate);
            var xbookings = await _holidayMakerContext.BookingXrooms.ToListAsync();
            bookedRooms.AddRange(from booking in bookings
                                 from xbooking in xbookings
                                 where booking.Id == xbooking.BookingId
                                 select xbooking.RoomId);

            List<Room> availableRooms = (from room in allRooms
                                         from bookedRoom in bookedRooms
                                         where room.Id != bookedRoom
                                         select room).ToList();

            //var availableRoomsId =_rs.GetAllAvailableRoomsByDestinationId(destinationId, checkInDate, checkOutDate).Result;
            IEnumerable<Hotel> availableHotels = (from hotel in hotels
                                   from room in allRooms
                                   from bookedRoom in bookedRooms
                                   where room.Id != bookedRoom
                                   select hotel).ToList();
            return  availableHotels.Distinct();

            //var allRooms =  await _holidayMakerContext.Rooms.ToListAsync();
            //availableHotels.AddRange(from hotel in GetAllHotelsByDestination(destinationId).Result
            //                         from availableRoom in availableRoomsId
            //                         from room in allRooms
            //                         where availableRoom == room.Id
            //                         select hotel);
            //return availableHotels.Distinct();
        }


    }
}
