using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class Hotel
    {
        public Hotel()
        {
            FavoriteHotels = new HashSet<FavoriteHotel>();
            HotelImages = new HashSet<HotelImage>();
            Reviews = new HashSet<Review>();
            Rooms = new HashSet<Room>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ZipCode { get; set; }
        public string Address { get; set; }
        public double StarRating { get; set; }
        public double DistanceToBeach { get; set; }
        public double DistanceToCityCenter { get; set; }
        public bool HasPool { get; set; }
        public bool HasSeaSide { get; set; }
        public bool HasEntertainment { get; set; }
        public bool HasKidsClub { get; set; }
        public bool HasWifi { get; set; }
        public bool HasRestaurant { get; set; }
        public bool HasHalfPension { get; set; }
        public bool HasWholePension { get; set; }
        public bool HasAllInclusive { get; set; }
        public bool HasRoomService { get; set; }
        public int DestinationId { get; set; }

        public virtual Destination Destination { get; set; }
        public virtual ICollection<FavoriteHotel> FavoriteHotels { get; set; }
        public virtual ICollection<HotelImage> HotelImages { get; set; }
        public virtual ICollection<Review> Reviews { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
