using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Customer
    {
        public Customer()
        {
            Bookings = new HashSet<Booking>();
            FavoriteHotels = new HashSet<FavoriteHotel>();
            Reviews = new HashSet<Review>();
        }

        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public bool IsLoggedIn { get; set; }
        public string Password { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
        public virtual ICollection<FavoriteHotel> FavoriteHotels { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
