using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Review
    {
        public int Id { get; set; }
        public double Rating { get; set; }
        public int CustomerId { get; set; }
        public int HotelId { get; set; }
        public string Heading { get; set; }
        public string Name { get; set; }
        public string ReviewText { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Hotel Hotel { get; set; }
    }
}
