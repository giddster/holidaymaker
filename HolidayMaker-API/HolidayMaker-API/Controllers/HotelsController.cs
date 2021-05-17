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
        private readonly HotelService _hotelService;

        public HotelsController(HolidayMakerContext context, HotelService hotelService)
        {
            _context = context;
            _hotelService = hotelService;
        }

        // GET: api/Hotels
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotels()
        {
            return await _context.Hotels.ToListAsync();
        }

        
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


        [HttpGet("/allHotelsByDestinationId/{destinationId}")]
        public async Task<IEnumerable<Hotel>> GetAllHotelsByDestinationId(int destinationId)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAllHotelsByDestination(destinationId);

            return availableHotels;

        }


        [HttpGet("/availablehotelsByDestinationId/{destinationId}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Hotel>> GetAllAvailableHotelsByDestinationId(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByDestinationId(destinationId, checkInDate, checkOutDate);

            return availableHotels;

        }




        [HttpGet("/availablehotelsByCityName/{cityName}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Hotel>> GetAllAvailableHotelsByCityName(string cityName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByCityName(cityName, checkInDate, checkOutDate);

            return availableHotels;

        }


        [HttpGet("/availablehotelsByCountryName/{countryName}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Hotel>> GetAllAvailableHotelsByCountryId(string countryName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByCountryName(countryName, checkInDate, checkOutDate);

            return availableHotels;

        }

    }
}
