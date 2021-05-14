using System;
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
        private readonly HotelService _hs;

        public RoomService(HolidayMakerContext holidayMakerContext, HotelService hs)
        {
            _holidayMakerContext = holidayMakerContext;
            _hs = hs;
        }

        public async Task<List<Room>> GetAllRoomsByDestinationId(int id)
        {
            List<Room> rooms = new List<Room>();
            var hotels = await _hs.GetAllHotelsByDestination(id);
            foreach (var hotel in hotels)
            {
                foreach (var room in hotel.Rooms)
                {
                    rooms.Add(room);
                }
            }
            return rooms;
        }
    }
}
