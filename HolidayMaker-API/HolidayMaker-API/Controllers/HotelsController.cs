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
    public class HotelsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;
        private readonly HotelService _hs;

        public HotelsController(HolidayMakerContext context, HotelService hotelService)
        {
            _context = context;
            _hs = hotelService;
        }

        // GET: api/Hotels
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotels()
        {
            return await _context.Hotels.ToListAsync();
        }

        //[HttpGet("/availablehotels/{destinationId}/{checkInDate}/{checkOutDate}")]
        //public async Task<ActionResult<IEnumerable <Hotel>>> GetAvailableHotels(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        //{
        //    return await GetAllAvailableHotels(destinationId, checkInDate, checkOutDate);
        //}

        // GET: api/Hotels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Hotel>> GetHotel(int id)
        {
            var hotel = await _context.Hotels.FindAsync(id);

            if (hotel == null)
            {
                return NotFound();
            }

            return hotel;
        }

        // PUT: api/Hotels/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutHotel(int id, Hotel hotel)
        {
            if (id != hotel.Id)
            {
                return BadRequest();
            }

            _context.Entry(hotel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HotelExists(id))
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

        // POST: api/Hotels
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Hotel>> PostHotel(Hotel hotel)
        {
            _context.Hotels.Add(hotel);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (HotelExists(hotel.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetHotel", new { id = hotel.Id }, hotel);
        }

        // DELETE: api/Hotels/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteHotel(int id)
        {
            var hotel = await _context.Hotels.FindAsync(id);
            if (hotel == null)
            {
                return NotFound();
            }

            _context.Hotels.Remove(hotel);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool HotelExists(int id)
        {
            return _context.Hotels.Any(e => e.Id == id);
        }
        [HttpGet("/availablehotels/{destinationId}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Hotel>> GetAllAvailableHotels(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {

            var hotels = await _context.Hotels.Where(h => h.DestinationId == destinationId).ToListAsync();
            List<int> rooms = new List<int>();
            var allRooms = await _context.Rooms.ToListAsync();
            rooms.AddRange(from hotel in hotels
                           from room in allRooms
                           where hotel.Id == room.HotelId
                           select room.Id);

            List<int> bookedRooms = new List<int>();
            var bookings = _context.Bookings.Where(r => r.CheckInDate >= checkInDate &&
                                                                       r.CheckOutDate <= checkOutDate);
            var xbookings = await _context.BookingXrooms.ToListAsync();
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
            return availableHotels.Distinct();

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
