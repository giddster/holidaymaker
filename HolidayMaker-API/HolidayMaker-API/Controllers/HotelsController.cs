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
    public class HotelsController : ControllerBase
    {
        private readonly HolidayMakerContext _context;

        public HotelsController(HolidayMakerContext context)
        {
            _context = context;
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
<<<<<<< Updated upstream
=======



        [HttpGet("/availablehotels/{destinationId}/{checkInDate}/{checkOutDate}")]
        public async Task<IEnumerable<Hotel>> GetAllAvailableHotels(int destinationId, DateTime checkInDate, DateTime checkOutDate)
        {
            //Hittar alla hotel på en given destination
            var hotels = await _context.Hotels.Where(h => h.DestinationId == destinationId).ToListAsync();


            //Tar fram alla rum som finns i Room
            var allRooms = await _context.Rooms.ToListAsync();

            //Tar fram alla rum som finns på de givna hotelen
            List<Room> rooms = new List<Room>();
            rooms.AddRange(from hotel in hotels
                           from room in allRooms
                           where hotel.Id == room.HotelId
                           select room);

            var bookings = await _context.Bookings.Where(r => r.CheckInDate >= checkInDate &&
                                                                       r.CheckOutDate <= checkOutDate).ToListAsync();



            //Returnerar 2 av 3 bokningar om man söker på: 2, 2021-05-09, 2021-05-14
            //Bokningar finns för: 2021-05-01 - 2021-05-31, 2021-05-01 - 2021-05-10, 2021-05-10 - 2021-05-15
            var bookings2 = await _context.Bookings.Where(r => (r.CheckInDate <= checkInDate && r.CheckOutDate >= checkOutDate) ||
                                                               (r.CheckInDate < checkInDate && r.CheckOutDate >= checkOutDate) ||
                                                               (checkInDate <= r.CheckInDate && checkInDate >= r.CheckOutDate) ||
                                                               (checkInDate >= r.CheckInDate && checkInDate <= r.CheckOutDate)).ToListAsync();


            var test1 = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).ToListAsync();

            //testa mer på denna. Returnerar alla 16rum som inte är bokade men ska returnara 15st
            var test = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId && r.BookingXrooms.All(b =>  
                                                                          (b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                                          (b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                                          (checkInDate <= b.Booking.CheckInDate && checkInDate >= b.Booking.CheckOutDate) ||
                                                                          (checkInDate >= b.Booking.CheckInDate && checkInDate <= b.Booking.CheckOutDate) )).ToListAsync();


            var test2 = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).Where(r =>  r.BookingXrooms.All(b =>
                                                              (b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                              (b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                              (checkInDate <= b.Booking.CheckInDate && checkInDate >= b.Booking.CheckOutDate) )).ToListAsync();



            //var test21 = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).Where(r => r.BookingXrooms.All(b =>

            //Returnerar alla bokade rum FUNKAR 100%
            var roomsBooked = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).Where(x => x.BookingXrooms.Any(b =>
                                      //(b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                      //(b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                      //(b.Booking.CheckInDate >= checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                                      //(b.Booking.CheckInDate > checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                                      ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                                      ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                                      ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                                      ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                                      ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)) )).ToListAsync();

            var roomsBooked1 = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).Where(x => !x.BookingXrooms.Any(b =>
                          //(b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                          //(b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                          //(b.Booking.CheckInDate >= checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                          //(b.Booking.CheckInDate > checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                          ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))).ToListAsync();


            //Returnerar alla lediga hotel
            var freeHotels = await _context.Hotels.Where(d => d.DestinationId == destinationId).Where(r => r.Rooms.Any(x => !x.BookingXrooms.Any(b =>
              //(b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
              //(b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
              //(b.Booking.CheckInDate >= checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
              //(b.Booking.CheckInDate > checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
              ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
              ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
              ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate))))).ToListAsync();


            //var free = from ro in _context.Rooms
            //            join h in _context.Hotels
            //                on ro.HotelId equals h.Id
            //            join bXr in _context.BookingXrooms
            //                on ro.Id equals bXr.RoomId
            //            join bo in _context.Bookings
            //                on bXr.BookingId equals bo.Id
            //            where ro.Id.Contains ()


            //var free = _context.Rooms.FromSqlRaw($"SELECT Room.RoomNo, Room.Id FROM Room" +
            //                                     " Join Hotel ON Hotel.Id = Room.HotelId" +
            //                                     " Join BookingXRoom ON BookingXRoom.RoomId = Room.Id" +
            //                                     " Join Booking ON BookingXRoom.BookingId = Booking.Id" +
            //                                     " WHERE Room.Id IN(" +
            //                                     " SELECT Room.Id FROM BOOKING B" +
            //                                     " JOIN BookingXRoom RB ON B.Id = RB.BookingID" +
            //                                     " Join Room ON Room.Id = RB.RoomId" +
            //                                     " WHERE(CheckInDate <= {checkInDate} AND CheckOutDate >= {checkInDate})" +
            //                                     " OR(CheckInDate < {checkOutDate} AND CheckOutDate >= {checkOutDate})" +
            //                                     " OR({checkInDate} <= CheckInDate AND {checkOutDate} >= CheckInDate)" +
            //                                     " and Hotel.DestinationId IN(SELECT Destination.Id FROM Destination" +
            //                                     " Join Hotel ON Destination.Id = Hotel.DestinationId" +
            //                                     " WHERE Hotel.DestinationId = {destinationId})", checkInDate, checkOutDate, destinationId).ToList();


            //System.Text.StringBuilder sb = new System.Text.StringBuilder();


            //sb.AppendLine(@"SELECT Room.RoomNo, Room.Id FROM Room");
            ////sb.AppendLine(@" Join Hotel ON Hotel.Id = Room.HotelId");
            ////sb.AppendLine(@" Join BookingXRoom ON BookingXRoom.RoomId = Room.Id");
            ////sb.AppendLine(@" Join Booking ON BookingXRoom.BookingId = Booking.Id");
            ////sb.AppendLine(@" WHERE Room.Id IN(");
            ////sb.AppendLine(@" SELECT Room.Id FROM BOOKING B");
            ////sb.AppendLine(@" JOIN BookingXRoom RB ON B.Id = RB.BookingID");
            ////sb.AppendLine(@" Join Room ON Room.Id = RB.RoomId");
            ////sb.AppendLine($" WHERE(CheckInDate <= {checkInDate} AND CheckOutDate >= {checkInDate})");
            ////sb.AppendLine($" OR(CheckInDate < {checkOutDate} AND CheckOutDate >= {checkOutDate})");
            ////sb.AppendLine($" OR({checkInDate} <= CheckInDate AND {checkOutDate} >= CheckInDate)");
            ////sb.AppendLine(@" and Hotel.DestinationId IN(SELECT Destination.Id FROM Destination");
            ////sb.AppendLine(@" Join Hotel ON Destination.Id = Hotel.DestinationId");
            ////sb.AppendLine($" WHERE Hotel.DestinationId = {destinationId})");

            //var query = sb.ToString();

            //var free = await _context.Rooms.FromSqlInterpolated(query).ToListAsync();



















            //DECLARE @ArrivalDate AS DATETIME = '2021-05-09'
            //DECLARE @DepartureDate AS DATETIME = '2021-05-14'
            //DECLARE @DestinationId AS INT = 2

            //SELECT Room.RoomNo, Room.Id
            //FROM Room
            //Join Hotel
            //    ON Hotel.Id = Room.HotelId
            //Join BookingXRoom

            //    ON BookingXRoom.RoomId = Room.Id
            //Join Booking

            //    ON BookingXRoom.BookingId = Booking.Id
            //WHERE Room.Id IN
            //(
            //    SELECT Room.Id
            //    FROM   BOOKING B
            //           JOIN BookingXRoom RB
            //               ON B.Id = RB.BookingID

            //           Join Room

            //               ON Room.Id = RB.RoomId



            //    WHERE  (CheckInDate <= @ArrivalDate AND CheckOutDate >= @ArrivalDate) --cases 3,5,7
            //           OR(CheckInDate < @DepartureDate AND CheckOutDate >= @DepartureDate)--cases 6,6
            //           OR(@ArrivalDate <= CheckInDate AND @DepartureDate >= CheckInDate)--case 4

            //)
            //and
            //Hotel.DestinationId IN(SELECT Destination.Id
            //                             FROM Destination
            //                             Join Hotel
            //                                ON Destination.Id = Hotel.DestinationId

            //                             WHERE Hotel.DestinationId = 2)


























            //Returnerar alla Obokade rum   FUNKAR 100%
            var roomsBooked2 = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).Where(x => !x.BookingXrooms.Any(b =>
                                      (b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                      (b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                      (b.Booking.CheckInDate >= checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                                      (b.Booking.CheckInDate > checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                                      ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                                      ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                                      ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                                      ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                                      ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))).ToListAsync();

            //Returnerar alla bokade rum FUNKAR 100%
            var roomsBooked3 = await _context.Rooms.Where(r => r.Hotel.DestinationId == destinationId).Where(x => x.BookingXrooms.Any(b =>
                          (b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                          (b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                          (b.Booking.CheckInDate >= checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                          (b.Booking.CheckInDate > checkInDate && b.Booking.CheckOutDate <= checkOutDate) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate)) ||
                          ((checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckInDate) && (checkOutDate <= b.Booking.CheckOutDate)) ||
                          ((checkInDate >= b.Booking.CheckInDate) && (checkInDate <= b.Booking.CheckOutDate) && (checkOutDate >= b.Booking.CheckOutDate)) ||
                          ((checkInDate <= b.Booking.CheckInDate) && (checkOutDate >= b.Booking.CheckOutDate)))).ToListAsync();








            var test3 = await _context.Rooms.Where(r => r.BookingXrooms.All(b =>
                                                             (b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                             (b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                             (checkInDate <= b.Booking.CheckInDate && checkInDate >= b.Booking.CheckOutDate) ||
                                                             (checkInDate >= b.Booking.CheckInDate && checkInDate <= b.Booking.CheckOutDate))).ToListAsync();




            var test4 = await _context.Rooms.Where(r => r.BookingXrooms.All(b =>
                                                 (b.Booking.CheckInDate <= checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                 (b.Booking.CheckInDate < checkInDate && b.Booking.CheckOutDate >= checkOutDate) ||
                                                 (checkInDate <= b.Booking.CheckInDate && checkInDate >= b.Booking.CheckOutDate) )).ToListAsync();


            var test5 = await _context.Rooms.Where(x => x.BookingXrooms.All(r => 
                                                   (r.Booking.CheckInDate <= checkInDate && r.Booking.CheckOutDate >= checkOutDate) ||
                                                   (r.Booking.CheckInDate < checkInDate && r.Booking.CheckOutDate >= checkOutDate) ||
                                                   (r.Booking.CheckInDate >= checkInDate && r.Booking.CheckOutDate <= checkOutDate) ||
                                                   (r.Booking.CheckInDate > checkInDate && r.Booking.CheckOutDate <= checkOutDate) ||


                                                   (checkInDate <= r.Booking.CheckInDate && checkInDate >= r.Booking.CheckOutDate) ||
                                                   (checkInDate >= r.Booking.CheckInDate && checkInDate <= r.Booking.CheckOutDate) ||


                                                   (checkInDate <= r.Booking.CheckOutDate && checkInDate >= r.Booking.CheckInDate) ||
                                                   (checkInDate >= r.Booking.CheckOutDate && checkInDate <= r.Booking.CheckInDate) )).ToListAsync();



            //var bookings50 = await _context.Bookings.Where(b => b.CheckInDate > checkInDate ||
            //                                             b.CheckInDate < checkInDate && 
            //                                             b.CheckOutDate > checkOutDate || 
            //                                             b.CheckOutDate < checkOutDate).ToListAsync();

            //var a = _context.Rooms.Where(a => !bookings3.Any(b => b.RoomID == a.ID)).ToList());
            //var a = await _context.Rooms.Where(a => !bookings50.Any(b => b.BookingXrooms.Any(c => c.Room.Id == a.Id))).ToListAsync();



            //var availableRooms = db.Rooms.Where(m => m.Reservations.All(r => r.Departure <= model.Arrival || r.Arrival >= model.Departure)


            //var matchingRooms = db.Rooms
            //                            .Where(room => room.RoomType == desiredRoomType)
            //                            .Where(room => room.Reservations.All(res => res.Departure < arrivalDate || res.Arrival > departureDate))
            ;

            //var matchingRooms = _context.Rooms.Where(h => h.Hotel.Destination.Id == destinationId)
                                                          //.Where(r => r.BookingXrooms.All(b => b.Booking.CheckOutDate < checkInDate || b.Booking.CheckInDate > checkOutDate));

            //Returnerar 2 av 3 bokningar om man söker på: 2, 2021-05-09, 2021-05-14
            //Bokningar finns för: 2021-05-01 - 2021-05-31, 2021-05-01 - 2021-05-10, 2021-05-10 - 2021-05-15
            var bookings5 = await _context.Bookings.Where(r => (r.CheckInDate <= checkInDate && r.CheckOutDate >= checkOutDate) ||
                                                               (r.CheckInDate < checkInDate && r.CheckOutDate >= checkOutDate) ||
                                                               (r.CheckInDate >= checkInDate && r.CheckOutDate <= checkOutDate) ||
                                                               (r.CheckInDate > checkInDate && r.CheckOutDate <= checkOutDate) ||


                                                               (checkInDate <= r.CheckInDate && checkInDate >= r.CheckOutDate) ||
                                                               (checkInDate >= r.CheckInDate && checkInDate <= r.CheckOutDate) ||


                                                               (checkInDate >= r.CheckOutDate && checkInDate <= r.CheckInDate) ||
                                                               (checkInDate <= r.CheckOutDate && checkInDate >= r.CheckInDate)).ToListAsync();



            




            var bookings3 = await _context.Bookings.Where(r => (r.CheckInDate <= checkInDate && r.CheckOutDate >= checkOutDate) ||
                                                               (r.CheckInDate < checkInDate && r.CheckOutDate >= checkOutDate) ||
                                                               (checkInDate <= r.CheckInDate && checkInDate >= r.CheckOutDate)).ToListAsync();


            var bookings4 = await _context.Bookings.Where(r => r.CheckInDate <= checkInDate && r.CheckOutDate >= checkOutDate).ToListAsync();





            //Tar fram alla boknings id som finns
            var xbookings = await _context.BookingXrooms.ToListAsync();



            //Hittar de bokade rummen
            List<Room> bookedRooms = (from booking in bookings
                                      from xbooking in xbookings
                                      where booking.Id == xbooking.BookingId
                                      select xbooking.Room).ToList();
            #region Original code
            //foreach (var booking in bookings)
            //{
            //    foreach (var xbooking in xbookings)
            //    {
            //        if (booking.Id == xbooking.BookingId)
            //        {
            //            bookedRooms.Add(xbooking.Room);
            //        }
            //    }
            //}
            #endregion



            //Tar fram alla rum som inte är bokade
            List<Room> nonBookedRooms = new List<Room>();
            List<Hotel> availableHotels = new List<Hotel>();
            foreach (var room in from bookedRoom in bookedRooms
                                 from room in rooms
                                 where room.Id != bookedRoom.Id
                                 select room)
            {
                nonBookedRooms.Add(room);
                availableHotels.Add(room.Hotel);
            }
            #region Original code

            //foreach (var bookedRoom in bookedRooms)
            //{
            //    foreach (var room in rooms)
            //    {
            //        if (room.Id != bookedRoom.Id)
            //        {
            //            nonBookedRooms.Add(room);

            //            availableHotels.Add(room.Hotel);
            //        }

            //    }
            //}
            #endregion











            #region OLD
            //var allRooms =  await _holidayMakerContext.Rooms.ToListAsync();
            //availableHotels.AddRange(from hotel in GetAllHotelsByDestination(destinationId).Result
            //                         from availableRoom in availableRoomsId
            //                         from room in allRooms
            //                         where availableRoom == room.Id
            //                         select hotel);
            //return availableHotels.Distinct();



            //bookedRooms.AddRange(from booking in bookings   //<----Smäller här
            //                     from xbooking in xbookings
            //                     where booking.Id == xbooking.BookingId
            //                     select xbooking.RoomId);

            //List<Room> availableRooms = (from room in allRooms
            //                             from bookedRoom in bookedRooms
            //                             where room.Id != bookedRoom
            //                             select room).ToList();

            //var availableRoomsId =_rs.GetAllAvailableRoomsByDestinationId(destinationId, checkInDate, checkOutDate).Result;


            //IEnumerable<Hotel> availableHotels = (from hotel in hotels
            //                                      from room in allRooms
            //                                      from bookedRoom in bookedRooms
            //                                      where room.Id != bookedRoom.Id
            //                                      select hotel).ToList();


            #endregion



            var distinctHotels = availableHotels.Distinct().ToList();





            return distinctHotels;

        }
>>>>>>> Stashed changes
    }
}
