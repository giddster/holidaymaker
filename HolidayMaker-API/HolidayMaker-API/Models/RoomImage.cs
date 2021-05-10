using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class RoomImage
    {
        public int Id { get; set; }
        public int RoomId { get; set; }
        public string ImageLink { get; set; }

        public virtual Room Room { get; set; }
    }
}
