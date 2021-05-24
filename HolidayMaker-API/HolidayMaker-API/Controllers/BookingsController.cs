using HolidayMaker_API.Models;
using HolidayMaker_API.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace HolidayMaker_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
    public class BookingsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;
        private readonly BookingService _bs;
        private readonly CustomerService _customerService;

        public BookingsController(HolidayMakerContext context, BookingService bs, CustomerService customerService)
        {
            _context = context;
            _bs = bs;
            this._customerService = customerService;
        }

        // GET: api/Bookings
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<Booking>>> GetBookings()
        //{
        //    return await _context.Bookings.ToListAsync();
        //}

        // GET: api/Bookings/5
        [HttpGet("{id}")]
        //public async Task<ActionResult<Booking>> GetBooking(int id)
        //{
        //    var booking = await _context.Bookings.FindAsync(id);

        //    if (booking == null)
        //    {
        //        return NotFound();
        //    }

        //    return booking;
        //}


        // GET: api/Bookings/5
        [HttpGet("/api/BookingsByCustomer/{id}")]
        public async Task<ActionResult<IEnumerable<Booking>>> GetAllBookingsByCustomer(int id)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);


            if (customerFromDB)
            {

                var booking = await _context.Bookings.Where(c => c.CustomerId == id).ToListAsync();

                if (booking == null)
                {
                    return NotFound();
                }

                return booking;
            }
            else
            {
                return BadRequest();
            }
        }


        // PUT: api/Bookings/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBooking(int id, Booking booking)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);


            if (customerFromDB)
            {

                if (id != booking.Id)
                {
                    return BadRequest();
                }

                _context.Entry(booking).State = EntityState.Modified;

                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!BookingExists(id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                return Ok(new { Message = "Updated booking" });
            }
            else
            {
                return NoContent();
            }

        }

        // POST: api/Bookings
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Booking>> PostBooking(Booking booking)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);


            if (customerFromDB)
            {

                _context.Bookings.Add(booking);


                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateException)
                {
                    if (BookingExists(booking.Id))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }

                return Ok(new { Message = "Added booking" });

                //return CreatedAtAction("GetBooking", new { id = booking.Id }, booking);
            }
            else
            {
                return BadRequest();
            }
        }


        //TODO: Kolla om kollen av checkindate inte är -5 dagar

        // DELETE: api/Bookings/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBooking(int id)
        {

            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);


            if (customerFromDB)
            {
                var booking = await _context.Bookings.FindAsync(id);
                if (booking == null)
                {
                    return NotFound();
                }

                _context.Bookings.Remove(booking);
                await _context.SaveChangesAsync();

                return NoContent();
            }
            else
            {
                return BadRequest();
            }
        }

        private bool BookingExists(int id)
        {
            return _context.Bookings.Any(e => e.Id == id);
        }
    }
}
