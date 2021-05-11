using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Room
    {
        public Room()
        {
            BookingXrooms = new HashSet<BookingXroom>();
            RoomImages = new HashSet<RoomImage>();
        }

        public int Id { get; set; }
        public int RoomNo { get; set; }
        public int NoOfSpareBeds { get; set; }
        public bool IsSelfCleaning { get; set; }
        public bool? IsOccupied { get; set; }
        public int HotelId { get; set; }
        public int RoomTypeId { get; set; }

        public virtual Hotel Hotel { get; set; }
        public virtual RoomType RoomType { get; set; }
        public virtual ICollection<BookingXroom> BookingXrooms { get; set; }
        public virtual ICollection<RoomImage> RoomImages { get; set; }
    }
}
