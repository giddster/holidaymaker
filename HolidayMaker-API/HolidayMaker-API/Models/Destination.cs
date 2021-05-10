using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Destination
    {
        public Destination()
        {
            Flights = new HashSet<Flight>();
            Hotels = new HashSet<Hotel>();
        }

        public int Id { get; set; }
        public string Country { get; set; }
        public string City { get; set; }

        public virtual ICollection<Flight> Flights { get; set; }
        public virtual ICollection<Hotel> Hotels { get; set; }
    }
}
