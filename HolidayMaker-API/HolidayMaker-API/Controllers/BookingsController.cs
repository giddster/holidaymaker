using HolidayMaker_API.Models;
using HolidayMaker_API.Services;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
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
        private readonly CustomerService _customerService;
        private Booking PendingBooking;

        public BookingsController(HolidayMakerContext context, CustomerService customerService)
        {
            _context = context;
            _customerService = customerService;
        }


        // GET: api/Bookings/5
        [HttpGet("/api/BookingsByCustomer/{id}")]
        public async Task<ActionResult<IEnumerable<Booking>>> GetAllBookingsByCustomer(int id)
        {
            var loggedInUserEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(loggedInUserEmail);


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
            var loggedInUserEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(loggedInUserEmail);


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
        public async Task<ActionResult<Booking>> PostBooking(InputBooking booking)
        {
            var tempBooking = new Booking();
            if (PendingBooking == null)
            {
                PendingBooking = new Booking();
            }

            var loggedInUserEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(loggedInUserEmail);
            if (booking.TotalPrice != 0)
            {
                PendingBooking.CheckInDate = booking.CheckInDate;
                PendingBooking.CheckOutDate = booking.CheckOutDate;
                PendingBooking.NoOfAdults = booking.NoOfAdults;
                PendingBooking.NoOfChildren = booking.NoOfChildren;
                PendingBooking.IsPending = booking.IsPending;
                PendingBooking.IsCancelled = booking.IsCancelled;
                PendingBooking.TotalPrice = booking.TotalPrice;
                PendingBooking.FlightId = booking.FlightId;
                PendingBooking.CustomerId = booking.CustomerId;

                return Ok(new { Message = "Added pending booking" });
            }
            else
            {
                if (customerFromDB)
                {

                    _context.Bookings.Add(PendingBooking);


                    try
                    {
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateException)
                    {
                        if (BookingExists(PendingBooking.Id))
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


        }


        //TODO: Kolla om kollen av checkindate inte är -5 dagar

        // DELETE: api/Bookings/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBooking(int id)
        {

            var loggedInUserEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(loggedInUserEmail);


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

    public class InputBooking
    {
        public DateTime CheckInDate { get; set; }
        public DateTime CheckOutDate { get; set; }
        public int NoOfAdults { get; set; }
        public int NoOfChildren { get; set; }
        public bool IsPending { get; set; }
        public bool IsCancelled { get; set; }
        public float TotalPrice { get; set; }
        public int FlightId { get; set; }
        public int CustomerId { get; set; }
    }
}

