using HolidayMaker_API.Models;
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
    public class HotelImagesController : Controller
    {
        private readonly HolidayMakerContext _context;

        public HotelImagesController(HolidayMakerContext context)
        {
            _context = context;
        }

        //GET: api/HotelImages
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomImage>>> GetRoomImages()
        {
            return await _context.RoomImages.ToListAsync();
        }
    }
}
