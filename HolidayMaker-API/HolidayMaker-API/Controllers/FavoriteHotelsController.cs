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
    public class FavoriteHotelsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;

        public FavoriteHotelsController(HolidayMakerContext context)
        {
            _context = context;
        }

        // GET: api/FavoriteHotels
        [HttpGet]
        public async Task<ActionResult<IEnumerable<FavoriteHotel>>> GetFavoriteHotels()
        {
            return await _context.FavoriteHotels.ToListAsync();
        }

        // GET: api/FavoriteHotels/5
        [HttpGet("{id}")]
        public async Task<ActionResult<FavoriteHotel>> GetFavoriteHotel(int id)
        {
            var favoriteHotel = await _context.FavoriteHotels.FindAsync(id);

            if (favoriteHotel == null)
            {
                return NotFound();
            }

            return favoriteHotel;
        }

        // PUT: api/FavoriteHotels/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFavoriteHotel(int id, FavoriteHotel favoriteHotel)
        {
            if (id != favoriteHotel.Id)
            {
                return BadRequest();
            }

            _context.Entry(favoriteHotel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FavoriteHotelExists(id))
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

        // POST: api/FavoriteHotels
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<FavoriteHotel>> PostFavoriteHotel(FavoriteHotel favoriteHotel)
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

            return CreatedAtAction("GetFavoriteHotel", new { id = favoriteHotel.Id }, favoriteHotel);
        }

        // DELETE: api/FavoriteHotels/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFavoriteHotel(int id)
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

        private bool FavoriteHotelExists(int id)
        {
            return _context.FavoriteHotels.Any(e => e.Id == id);
        }
    }
}
