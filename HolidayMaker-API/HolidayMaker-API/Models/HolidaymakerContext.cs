﻿using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace HolidayMaker_API.Models
{
    public partial class HolidayMakerContext : DbContext
    {
        public HolidayMakerContext()
        {
        }

        public HolidayMakerContext(DbContextOptions<HolidayMakerContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<BookingXroom> BookingXrooms { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Destination> Destinations { get; set; }
        public virtual DbSet<FavoriteHotel> FavoriteHotels { get; set; }
        public virtual DbSet<Flight> Flights { get; set; }
        public virtual DbSet<Hotel> Hotels { get; set; }
        public virtual DbSet<HotelImage> HotelImages { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Room> Rooms { get; set; }
        public virtual DbSet<RoomImage> RoomImages { get; set; }
        public virtual DbSet<RoomType> RoomTypes { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=tcp:grupp3holidaymaker.database.windows.net;Database=HolidayMaker;Persist Security Info=False;User ID=yahya;Password=Password1;Encrypt=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Booking>(entity =>
            {
                entity.ToTable("Booking");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CheckInDate).HasColumnType("date");

                entity.Property(e => e.CheckOutDate).HasColumnType("date");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Booking__Custome__7A672E12");

                entity.HasOne(d => d.Flight)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.FlightId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Booking__FlightI__797309D9");
            });

            modelBuilder.Entity<BookingXroom>(entity =>
            {
                entity.HasKey(e => new { e.RoomId, e.BookingId })
                    .HasName("PK__BookingX__F5BF689745960560");

                entity.ToTable("BookingXRoom");

                entity.HasOne(d => d.Booking)
                    .WithMany(p => p.BookingXrooms)
                    .HasForeignKey(d => d.BookingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BookingXR__Booki__7E37BEF6");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.BookingXrooms)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BookingXR__RoomI__7D439ABD");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("Customer");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.City)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Country)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Email)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.ZipCode)
                    .IsRequired()
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Destination>(entity =>
            {
                entity.ToTable("Destination");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.City)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Country)
                    .IsRequired()
                    .IsUnicode(false);
            });

            modelBuilder.Entity<FavoriteHotel>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.FavoriteHotels)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__FavoriteH__Custo__70DDC3D8");

                entity.HasOne(d => d.Hotel)
                    .WithMany(p => p.FavoriteHotels)
                    .HasForeignKey(d => d.HotelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__FavoriteH__Hotel__6FE99F9F");
            });

            modelBuilder.Entity<Flight>(entity =>
            {
                entity.ToTable("Flight");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AviatorName)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.DepartureCity)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.DepartureCountry)
                    .IsRequired()
                    .IsUnicode(false);

                entity.HasOne(d => d.Destination)
                    .WithMany(p => p.Flights)
                    .HasForeignKey(d => d.DestinationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Flight__Destinat__693CA210");
            });

            modelBuilder.Entity<Hotel>(entity =>
            {
                entity.ToTable("Hotel");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Description)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.ZipCode)
                    .IsRequired()
                    .IsUnicode(false);

                entity.HasOne(d => d.Destionation)
                    .WithMany(p => p.Hotels)
                    .HasForeignKey(d => d.DestionationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Hotel__Destionat__628FA481");
            });

            modelBuilder.Entity<HotelImage>(entity =>
            {
                entity.ToTable("HotelImage");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ImageLink).IsUnicode(false);

                entity.HasOne(d => d.Hotel)
                    .WithMany(p => p.HotelImages)
                    .HasForeignKey(d => d.HotelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__HotelImag__Hotel__76969D2E");
            });

            modelBuilder.Entity<Review>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ReviewText)
                    .IsRequired()
                    .IsUnicode(false);

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reviews__Custome__6C190EBB");

                entity.HasOne(d => d.Hotel)
                    .WithMany(p => p.Reviews)
                    .HasForeignKey(d => d.HotelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Reviews__HotelId__6D0D32F4");
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.ToTable("Room");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.HasOne(d => d.Hotel)
                    .WithMany(p => p.Rooms)
                    .HasForeignKey(d => d.HotelId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Room__HotelId__656C112C");

                entity.HasOne(d => d.RoomType)
                    .WithMany(p => p.Rooms)
                    .HasForeignKey(d => d.RoomTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Room__RoomTypeId__66603565");
            });

            modelBuilder.Entity<RoomImage>(entity =>
            {
                entity.ToTable("RoomImage");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ImageLink).IsUnicode(false);

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.RoomImages)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__RoomImage__RoomI__73BA3083");
            });

            modelBuilder.Entity<RoomType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.TypeName)
                    .IsRequired()
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
