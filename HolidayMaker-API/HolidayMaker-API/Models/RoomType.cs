using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class RoomType
    {
        public RoomType()
        {
            Rooms = new HashSet<Room>();
        }

        public int Id { get; set; }
        public string TypeName { get; set; }
        public int Capacity { get; set; }
        public double Price { get; set; }

        public virtual ICollection<Room> Rooms { get; set; }
    }
}
