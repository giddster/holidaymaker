using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Booking
    {
        public Booking()
        {
            BookingXrooms = new HashSet<BookingXroom>();
        }

        public int Id { get; set; }
        public DateTime CheckInDate { get; set; }
        public DateTime CheckOutDate { get; set; }
        public int NoOfAdults { get; set; }
        public int NoOfChildren { get; set; }
        public bool IsPending { get; set; }
        public bool IsCancelled { get; set; }
        public double TotalPrice { get; set; }
        public int? FlightId { get; set; }
        public int CustomerId { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Flight Flight { get; set; }
        public virtual ICollection<BookingXroom> BookingXrooms { get; set; }
    }
}
