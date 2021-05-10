using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class HotelImage
    {
        public int Id { get; set; }
        public int HotelId { get; set; }
        public string ImageLink { get; set; }

        public virtual Hotel Hotel { get; set; }
    }
}
