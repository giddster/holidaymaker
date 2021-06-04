﻿using System;
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
    public class ReviewsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;

        public ReviewsController(HolidayMakerContext context)
        {
            _context = context;
        }

        // GET: api/Reviews
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Review>>> GetReviews()
        {
            return await _context.Reviews.ToListAsync();
        }



        #region OLD GetReviews
        //// GET: api/Reviews/5
        //[HttpGet("{id}")]
        //public async Task<ActionResult<Review>> GetReview(int id)
        //{
        //    var review = await _context.Reviews.FindAsync(id);

        //    if (review == null)
        //    {
        //        return NotFound();
        //    }

        //    return review;
        //}
        #endregion

        // GET: api/Reviews/5
        [HttpGet("{id}")]
        public async Task<ActionResult<IEnumerable<Review>>> GetReviewsByHotel(int id)
        {
            var review = await _context.Reviews.Where(c => c.HotelId == id).ToListAsync();


            if (review == null)
            {
                return NotFound();
            }

            return review;
        }


        #region OLD Används ej kan raderas
        //// PUT: api/Reviews/5
        //// To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        //[HttpPut("{id}")]
        //public async Task<IActionResult> PutReview(int id, Review review)
        //{
        //    if (id != review.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(review).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!ReviewExists(id))
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

        // POST: api/Reviews
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Review>> PostReview(Review review)
        {
            _context.Reviews.Add(review);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ReviewExists(review.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetReview", new { id = review.Id }, review);
        }

        #region OLD Används ej kan raderas
        //// DELETE: api/Reviews/5
        //[HttpDelete("{id}")]
        //public async Task<IActionResult> DeleteReview(int id)
        //{
        //    var review = await _context.Reviews.FindAsync(id);
        //    if (review == null)
        //    {
        //        return NotFound();
        //    }

        //    _context.Reviews.Remove(review);
        //    await _context.SaveChangesAsync();

        //    return NoContent();
        //}
        #endregion

        private bool ReviewExists(int id)
        {
            return _context.Reviews.Any(e => e.Id == id);
        }
    }
}
