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

        //public async Task<IEnumerable<int>> GetAllRoomsByDestinationId(int destinationId)
        //{
        //    List<int> rooms = new List<int>();
           
           
        //    var allRooms = await _holidayMakerContext.Rooms.ToListAsync();
        //    rooms.AddRange(from hotel in hotels
        //                   from room in allRooms
        //                   where hotel.Id == room.HotelId
        //                   select room.Id);
        //    return rooms.ToList();
        //}

        //public async Task<List<int>> GetAllAvailableRoomsByDestinationId(int destinationId,DateTime checkInDate, DateTime checkOutDate)
        //{
        //    List<int> bookedRooms = new List<int>();
        //    var bookings = _holidayMakerContext.Bookings.Where(r => r.CheckInDate >= checkInDate &&
        //                                                               r.CheckOutDate <= checkOutDate);
        //   var xbookings = await _holidayMakerContext.BookingXrooms.ToListAsync();
        //    bookedRooms.AddRange(from booking in bookings
        //                         from xbooking in xbookings
        //                         where booking.Id == xbooking.BookingId
        //                         select xbooking.RoomId);
            
        //    var allRooms = GetAllRoomsByDestinationId(destinationId).Result;
            

        //    List<int> availableRooms = new List<int>();

        //    foreach (var room in allRooms)
        //    {
        //        foreach (var bookedRoom in bookedRooms)
        //        {
        //            if(room != bookedRoom)
        //            {
        //                availableRooms.Add(room);
        //            }
        //        }
        //    }

        //    return availableRooms;
        //}


    }
}
