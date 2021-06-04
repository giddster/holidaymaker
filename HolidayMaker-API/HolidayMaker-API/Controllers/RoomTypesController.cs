using HolidayMaker_API.Models;
using Microsoft.AspNetCore.Http;
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
    public class RoomTypesController : Controller
    {
        private readonly HolidayMakerContext _context;

        public RoomTypesController(HolidayMakerContext context)
        {
            _context = context;
        }

        // GET: RoomTypesController
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RoomType>>> GetAllRoomTypes()
        {
            return await _context.RoomTypes.ToListAsync();
        }
    }
}
