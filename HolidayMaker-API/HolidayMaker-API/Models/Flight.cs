using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Flight
    {
        public Flight()
        {
            Bookings = new HashSet<Booking>();
        }

        public int Id { get; set; }
        public string AviatorName { get; set; }
        public string DepartureCity { get; set; }
        public string DepartureCountry { get; set; }
        public bool IsReturnFlight { get; set; }
        public double Price { get; set; }
        public int DestinationId { get; set; }

        public virtual Destination Destination { get; set; }
        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
