using HolidayMaker_API.Models;
using HolidayMaker_API.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


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


        #region Behövs ej kan raderas
        //// PUT: api/Hotels/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutHotel(int id, Hotel hotel)
        //{
        //    if (id != hotel.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(hotel).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!HotelExists(id))
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

        //// POST: api/Hotels
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPost]
        //public async Task<ActionResult<Hotel>> PostHotel(Hotel hotel)
        //{
        //    _context.Hotels.Add(hotel);
        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateException)
        //    {
        //        if (HotelExists(hotel.Id))
        //        {
        //            return Conflict();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }

        //    return CreatedAtAction("GetHotel", new { id = hotel.Id }, hotel);
        //}

        //// DELETE: api/Hotels/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteHotel(int id)
        //{
        //    var hotel = await _context.Hotels.FindAsync(id);

        //    if (hotel == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Hotels.Remove(hotel);
        //    await _context.SaveChangesAsync();

        //    return NoContent();
        //}

        //private bool HotelExists(int id)
        //{
        //    return _context.Hotels.Any(e => e.Id == id);
        //}
        #endregion



        #region OLD Before changes
        //[HttpGet("/api/allHotelsByDestinationId/{destinationId}")]

        //public async Task<IEnumerable<Hotel>> GetAllHotelsByDestinationId(int destinationId)

        //{

        ////Maybe add some verification controls


        //var availableHotels = await _hotelService.GetAllHotelsByDestination(destinationId);


        //return availableHotels;


        //}
        #endregion


        [HttpGet("/api/allHotelsByDestinationId/{destinationId}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetAllHotelsByDestinationId(int destinationId)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAllHotelsByDestination(destinationId);

            if (availableHotels == null)
            {
                return NotFound();
            }


            return availableHotels.ToList();

        }


        [HttpGet("/api/availablehotelsByDestinationId/{destinationId}/{checkInDate}/{checkOutDate}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetAllAvailableHotelsByDestinationId(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByDestinationId(destinationId, checkInDate, checkOutDate);

            if (availableHotels == null)
            {
                return NotFound();
            }

            return availableHotels.ToList();

        }

        [HttpGet("/api/availablehotelsByCityOrCountryName/{cityOrCountryName}/{checkInDate}/{checkOutDate}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetAllAvailablehotelsByCityOrCountryName(string cityOrCountryName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByCityOrCountryName(cityOrCountryName, checkInDate, checkOutDate);

            if (availableHotels == null)
            {
                return NotFound();
            }

            return availableHotels.ToList();

        }


        [HttpGet("/api/availablehotelsByCityName/{cityName}/{checkInDate}/{checkOutDate}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetAllAvailableHotelsByCityName(string cityName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByCityName(cityName, checkInDate, checkOutDate);

            if (availableHotels == null)
            {
                return NotFound();
            }

            return availableHotels.ToList();

        }


        [HttpGet("/api/availablehotelsByCountryName/{countryName}/{checkInDate}/{checkOutDate}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetAllAvailableHotelsByCountryId(string countryName, DateTime checkInDate, DateTime checkOutDate)
        {
            //Maybe add some verification controls

            var availableHotels = await _hotelService.GetAvailableHotelsByCountryName(countryName, checkInDate, checkOutDate);

            if (availableHotels == null)
            {
                return NotFound();
            }

            return availableHotels.ToList();

        }


        [HttpGet("/api/GetHotelImagesById/{id}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotelImagesById(int id)
        {
            //var hotel = await _context.Hotels.FindAsync(id).Include(x => x.HotelImages);

            var hotelImages = await _hotelService.GetAllHotelImagesById(id);

            if (hotelImages == null)
            {
                return NotFound();
            }

            return hotelImages.ToList();
        }

        [HttpGet("/api/GetHotelImagesByCityOrCountryName/{cityOrCountryName}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotelImagesByCityOrCountryName(string cityOrCountryName)
        {
            //var hotel = await _context.Hotels.FindAsync(id).Include(x => x.HotelImages);

            var hotelImages = await _hotelService.GetHotelImagesByCityOrCountryName(cityOrCountryName);

            if (hotelImages == null)
            {
                return NotFound();
            }

            return hotelImages.ToList();
        }



        [HttpGet("/api/GetHotelImagesByHotelName/{hotelName}")]
        public async Task<ActionResult<IEnumerable<Hotel>>> GetHotelImagesByHotelName(string hotelName)
        {
            //var hotel = await _context.Hotels.FindAsync(id).Include(x => x.HotelImages);

            var hotelImages = await _hotelService.GetHotelImagesByHotelName(hotelName);

            if (hotelImages == null)
            {
                return NotFound();
            }

            return hotelImages.ToList();
        }

    }
}
