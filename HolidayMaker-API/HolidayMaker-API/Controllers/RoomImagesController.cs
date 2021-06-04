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
    public class RoomImagesController : Controller
    {
        private readonly HolidayMakerContext _context;

        public RoomImagesController(HolidayMakerContext context)
        {
            _context = context;
        }

        //GET: api/RoomImages
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomImage>>> GetRoomImages()
        {
            return await _context.RoomImages.ToListAsync();
        }
    }
}
