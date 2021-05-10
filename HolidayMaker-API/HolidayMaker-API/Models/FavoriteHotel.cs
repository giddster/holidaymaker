using System;
using System.Collections.Generic;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class FavoriteHotel
    {
        public FavoriteHotel()
        {
            Hotels = new HashSet<Hotel>();
        }

        public int Id { get; set; }
        public int CustomerId { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual ICollection<Hotel> Hotels { get; set; }
    }
}
