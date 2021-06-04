using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HolidayMaker_API.Models;
using HolidayMaker_API.Services;

namespace HolidayMaker_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;
        private readonly RoomService _roomService;

        public RoomsController(HolidayMakerContext context, RoomService roomService)
        {
            _context = context;
            _roomService = roomService;
        }

        [HttpGet("/api/availableRoomsByDestinationId/{destinationId}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Room>> GetAllAvailableRoomsByDestinationId(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            var availableRooms = await _roomService.GetAvailableRoomsByHotelId(destinationId, checkInDate, checkOutDate);

            return availableRooms;
        }

        [HttpGet("/api/availableRoomsByHotelId/{hotelId}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Room>> GetAllAvailableRoomsByHotelId(int hotelId, DateTime checkInDate, DateTime checkOutDate)
        {
            var availableRooms = await _roomService.GetAvailableRoomsByHotelId(hotelId, checkInDate, checkOutDate);

            return availableRooms;
        }


        [HttpGet("/api/availableRoomsByHotelName/{hotelName}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Room>> GetAllAvailableRoomsByHotelName(string hotelName, DateTime checkInDate, DateTime checkOutDate)
        {
            var availableRooms = await _roomService.GetAvailableRoomsByHotelName(hotelName, checkInDate, checkOutDate);

            return availableRooms;
        }



        // GET: api/Rooms
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Room>>> GetRooms()
        {
            return await _context.Rooms.ToListAsync();
        }

        //[HttpGet("/test/{id}")]
        //public async Task<ActionResult<IEnumerable<int>>> GetAllRoomsByDestinationId(int id)
        //{
        //    var result = await _rs.GetAllRoomsByDestinationId(id);
        //    return result;
        //}

        // GET: api/Rooms/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Room>> GetRoom(int id)
        {
            var room = await _context.Rooms.FindAsync(id);

            if (room == null)
            {
                return NotFound();
            }

            return room;
        }

        #region OLD Används ej kan raderas
        //// PUT: api/Rooms/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutRoom(int id, Room room)
        //{
        //    if (id != room.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(room).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!RoomExists(id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return NoContent();
        //}

        //// POST: api/Rooms
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Room>> PostRoom(Room room)
        //{
        //    _context.Rooms.Add(room);
        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateException)
        //    {
        //        if (RoomExists(room.Id))
        //        {
        //            return Conflict();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return CreatedAtAction("GetRoom", new { id = room.Id }, room);
        //}

        //// DELETE: api/Rooms/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteRoom(int id)
        //{
        //    var room = await _context.Rooms.FindAsync(id);
        //    if (room == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Rooms.Remove(room);
        //    await _context.SaveChangesAsync();

        //    return NoContent();
        //}
        #endregion


        private bool RoomExists(int id)
        {
            return _context.Rooms.Any(e => e.Id == id);
        }
    }
}
