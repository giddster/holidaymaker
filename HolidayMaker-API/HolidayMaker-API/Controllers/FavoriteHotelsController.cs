using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using HolidayMaker_API.Models;
using HolidayMaker_API.Services;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;

namespace HolidayMaker_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
    public class FavoriteHotelsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;
        private readonly CustomerService _customerService;
        private readonly FavoriteHotelsService _favoriteHotelsService;

        public FavoriteHotelsController(HolidayMakerContext context, CustomerService customerService, FavoriteHotelsService favoriteHotelsService)
        {
            _context = context;
            _customerService = customerService;
            this._favoriteHotelsService = favoriteHotelsService;
        }

        #region OLD
        // GET: api/FavoriteHotels
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<FavoriteHotel>>> GetFavoriteHotels()
        //{
        //    return await _context.FavoriteHotels.ToListAsync();
        //}
        #endregion

        // GET: api/FavoriteHotels/5
        [HttpGet("{id}")]
        //[Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
        public async Task<ActionResult<IEnumerable<FavoriteHotel>>> GetFavoriteHotelByUser(int id)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);

            if (customerFromDB)
            {
                List<FavoriteHotel> favoriteHotel = await _favoriteHotelsService.GetFavoriteHotelByUserId(id);

                if (favoriteHotel == null)
                {
                    return NotFound();
                }

                return favoriteHotel;
            }
            else
            {
                return BadRequest();

            }

        }

        

        #region OLD
        // PUT: api/FavoriteHotels/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutFavoriteHotel(int id, FavoriteHotel favoriteHotel)
        //{
        //    if (id != favoriteHotel.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(favoriteHotel).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!FavoriteHotelExists(id))
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
        #endregion

        // POST: api/FavoriteHotels
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        //[Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
        public async Task<ActionResult<FavoriteHotel>> PostFavoriteHotel(FavoriteHotel favoriteHotel)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);


            if (!FavoriteHotelExistsByUserId(favoriteHotel.HotelId, favoriteHotel.CustomerId) && customerFromDB)
            {
                _context.FavoriteHotels.Add(favoriteHotel);

                try
                {
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateException)
                {
                    if (FavoriteHotelExists(favoriteHotel.Id))
                    {
                        return Conflict();
                    }
                    else
                    {
                        throw;
                    }
                }

                //Fixa denna
                return Ok(new { Message = "Added favorite hotel" });
                //return CreatedAtAction("GetFavoriteHotel", new { id = favoriteHotel.Id }, favoriteHotel);
            }
            else
            {
                //Fixa en annan response
                return BadRequest();
            }
        }




        //TODO: Kolla om DeleteFavoriteHotel behöver ändras
        //Delete ej klar måste söka upp users favoritehotel och delete inte på id bara

        // DELETE: api/FavoriteHotels/5
        [HttpDelete("{id}")]
        //[Authorize(AuthenticationSchemes = CookieAuthenticationDefaults.AuthenticationScheme)]
        public async Task<IActionResult> DeleteFavoriteHotel(int id)
        {
            var userEmail = User.FindFirstValue(ClaimTypes.Email);

            var customerFromDB = _customerService.UserExistsByEmail(userEmail);

            if (customerFromDB)
            {

                var favoriteHotel = await _context.FavoriteHotels.FindAsync(id);

                if (favoriteHotel == null)
                {
                    return NotFound();
                }

                _context.FavoriteHotels.Remove(favoriteHotel);
                await _context.SaveChangesAsync();

                return NoContent();
            }
            else
            {
                return BadRequest();
            }
        }

        private bool FavoriteHotelExists(int id)
        {
            return _context.FavoriteHotels.Any(e => e.Id == id);
        }

        private bool FavoriteHotelExistsByUserId(int hotelId, int customerId)
        {
            return _context.FavoriteHotels.Where(fh => fh.CustomerId == customerId).Any(b => b.HotelId == hotelId);
        }


    }
}
