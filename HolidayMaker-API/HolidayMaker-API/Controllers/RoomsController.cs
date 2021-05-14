using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HolidayMaker_API.Models;

namespace HolidayMaker_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;

        public RoomsController(HolidayMakerContext context)
        {
            _context = context;
        }

        //// GET: api/Rooms
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Room>>> GetRooms()
        //{
        //    return await _context.Rooms.ToListAsync();
        //}

        // GET: api/Rooms/GetAvailableRoomsInSpecificHotel/
        [HttpGet]
        public async Task<ActionResult<IEnumerable<BookingXroom>>> GetAvailableRoomsInSpecificHotel(int hotelId, DateTime checkInDate, DateTime checkOutDate, int numberOfCustomers)
        {
            if (checkInDate < checkOutDate)
            {
                return await _context.BookingXrooms.Where(r =>
                r.Room.Hotel.Id == hotelId &&
                checkInDate > r.Booking.CheckOutDate ||
                checkOutDate < r.Booking.CheckInDate &&
                r.Room.RoomType.Capacity >= numberOfCustomers).ToListAsync();
            }

            return null;
            
        }

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

        // PUT: api/Rooms/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRoom(int id, Room room)
        {
            if (id != room.Id)
            {
                return BadRequest();
            }

            _context.Entry(room).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RoomExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Rooms
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Room>> PostRoom(Room room)
        {
            _context.Rooms.Add(room);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (RoomExists(room.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetRoom", new { id = room.Id }, room);
        }

        // DELETE: api/Rooms/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRoom(int id)
        {
            var room = await _context.Rooms.FindAsync(id);
            if (room == null)
            {
                return NotFound();
            }

            _context.Rooms.Remove(room);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool RoomExists(int id)
        {
            return _context.Rooms.Any(e => e.Id == id);
        }
    }
}
