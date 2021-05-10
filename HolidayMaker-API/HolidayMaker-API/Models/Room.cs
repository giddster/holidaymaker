using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Room
    {
        public Room()
        {
            RoomImages = new HashSet<RoomImage>();
        }

        public int Id { get; set; }
        public int RoomNo { get; set; }
        public int NoOfSpareBeds { get; set; }
        public bool IsSelfCleaning { get; set; }
        public bool IsOccupied { get; set; }
        public int HotelId { get; set; }
        public int RoomTypesId { get; set; }
        public int BokingId { get; set; }

        public virtual Booking Boking { get; set; }
        public virtual Hotel Hotel { get; set; }
        public virtual RoomType RoomTypes { get; set; }
        public virtual ICollection<RoomImage> RoomImages { get; set; }
    }
}
