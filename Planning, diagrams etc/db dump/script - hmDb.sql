/****** Object:  Database [HolidayMaker5]    Script Date: 21-06-09 15:35:02 ******/
CREATE DATABASE [HolidayMaker5]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [HolidayMaker5] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [HolidayMaker5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HolidayMaker5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HolidayMaker5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HolidayMaker5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HolidayMaker5] SET ARITHABORT OFF 
GO
ALTER DATABASE [HolidayMaker5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HolidayMaker5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HolidayMaker5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HolidayMaker5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HolidayMaker5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HolidayMaker5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HolidayMaker5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HolidayMaker5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HolidayMaker5] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [HolidayMaker5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HolidayMaker5] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HolidayMaker5] SET  MULTI_USER 
GO
ALTER DATABASE [HolidayMaker5] SET ENCRYPTION ON
GO
ALTER DATABASE [HolidayMaker5] SET QUERY_STORE = ON
GO
ALTER DATABASE [HolidayMaker5] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CheckInDate] [date] NULL,
	[CheckOutDate] [date] NULL,
	[NoOfAdults] [int] NOT NULL,
	[NoOfChildren] [int] NOT NULL,
	[IsPending] [bit] NOT NULL,
	[IsCancelled] [bit] NOT NULL,
	[TotalPrice] [float] NULL,
	[FlightId] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK__Booking__3214EC07EA45DF6F] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookingXroom]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookingXroom](
	[RoomId] [int] NOT NULL,
	[BookingId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC,
	[BookingId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Customer__3214EC07BFBD3BE2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destination]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destination](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteHotels]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteHotels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AviatorName] [varchar](50) NOT NULL,
	[DepartureCity] [varchar](50) NOT NULL,
	[DepartureCountry] [varchar](50) NOT NULL,
	[IsReturnFlight] [bit] NOT NULL,
	[Price] [float] NOT NULL,
	[DestinationId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ZipCode] [varchar](50) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[StarRating] [float] NOT NULL,
	[DistanceToBeach] [float] NOT NULL,
	[DistanceToCityCenter] [float] NOT NULL,
	[HasPool] [bit] NOT NULL,
	[HasSeaSIde] [bit] NOT NULL,
	[HasEntertainment] [bit] NOT NULL,
	[HasKIdsClub] [bit] NOT NULL,
	[HasRestaurant] [bit] NOT NULL,
	[HasHalfPension] [bit] NOT NULL,
	[HasWholePension] [bit] NOT NULL,
	[HasAllInclusive] [bit] NOT NULL,
	[HasWifi] [bit] NOT NULL,
	[HasRoomService] [bit] NOT NULL,
	[DestinationId] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImageLink] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Rating] [float] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Heading] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[ReviewText] [varchar](1000) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NOT NULL,
	[RoomNo] [int] NOT NULL,
	[NoOfSpareBeds] [int] NOT NULL,
	[IsSelfCleaning] [bit] NOT NULL,
	[IsOccupied] [bit] NULL,
	[RoomTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImage]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[ImageLink] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 21-06-09 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [varchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (1, CAST(N'2020-12-24' AS Date), CAST(N'2021-01-06' AS Date), 2, 1, 0, 0, 19806, 1, 1)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (2, CAST(N'2021-07-01' AS Date), CAST(N'2021-07-08' AS Date), 2, 0, 1, 0, 8392, 2, 2)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (3, CAST(N'2021-05-01' AS Date), CAST(N'2021-05-31' AS Date), 1, 0, 0, 0, 20277, 3, 3)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (4, CAST(N'2021-05-10' AS Date), CAST(N'2021-05-15' AS Date), 2, 1, 0, 1, 5825, NULL, 1)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (5, CAST(N'2021-05-01' AS Date), CAST(N'2021-05-10' AS Date), 2, 1, 1, 0, 5825, NULL, 1)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (6, CAST(N'2021-07-01' AS Date), CAST(N'2021-07-08' AS Date), 2, 2, 1, 0, 4809, NULL, 1)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (7, CAST(N'2021-05-10' AS Date), CAST(N'2021-05-15' AS Date), 2, 1, 1, 0, 5825, NULL, 4)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (8, CAST(N'2021-05-01' AS Date), CAST(N'2021-05-30' AS Date), 2, 1, 1, 0, 5825, NULL, 5)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (10, CAST(N'2021-05-26' AS Date), CAST(N'2021-05-27' AS Date), 2, 1, 1, 0, 1000, NULL, 12)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (14, CAST(N'2021-06-09' AS Date), CAST(N'2021-06-14' AS Date), 1, 1, 1, 0, 50000, NULL, 1)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (33, CAST(N'2021-07-01' AS Date), CAST(N'2021-07-07' AS Date), 2, 1, 1, 0, 7000, NULL, 1)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (34, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1000, NULL, NULL)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (37, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1001, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (38, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1001, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (39, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1001, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (40, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1001, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (41, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1001, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (42, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 4, 0, 1, 1, 543, 8, 52)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (43, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 4, 0, 1, 1, 543, 8, 52)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (44, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 4, 0, 1, 1, 543, 8, 52)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (45, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 4, 0, 1, 1, 543, 8, 52)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (46, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 4, 0, 1, 1, 543, 8, 52)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (47, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1011, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (48, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1011, 8, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (49, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 4, 0, 1, 1, 543, 8, 52)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (50, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 1, 1, 1011, 11, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (52, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 0, 0, 1011, 13, 55)
INSERT [dbo].[Booking] ([Id], [CheckInDate], [CheckOutDate], [NoOfAdults], [NoOfChildren], [IsPending], [IsCancelled], [TotalPrice], [FlightId], [CustomerId]) VALUES (53, CAST(N'2021-06-10' AS Date), CAST(N'2021-06-15' AS Date), 2, 0, 0, 0, 1011, 14, 55)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (1, 47)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (2, 48)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (2, 50)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (2, 52)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (2, 53)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (3, 1)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (4, 3)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (4, 42)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (4, 45)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (4, 46)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (4, 49)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (5, 49)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (7, 49)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (10, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (11, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (12, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (13, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (14, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (15, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (16, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (17, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (18, 14)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (20, 5)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (20, 33)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (21, 7)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (21, 33)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (22, 8)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (22, 33)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (23, 33)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (24, 33)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (27, 2)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (28, 6)
INSERT [dbo].[bookingXroom] ([RoomId], [BookingId]) VALUES (36, 4)
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (1, N'Abdi', N'Benådsson', N'Himlastråket 666', N'12345', N'Eden', N'Sweden', N'send_me_your_prayers@abdi.com', N'0704563212')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (2, N'Cecilia', N'Lind', N'Sillstigen 12', N'65225', N'Karlstad', N'Sweden', N'lind.cecilia@coldmail.com', N'0736545285')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (3, N'Darko', N'Petrovic', N'Gnejsvägen 45', N'84070', N'Hammarstrand', N'Sweden', N'darko.petrovic@gomail.com', N'0726547894')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (4, N'Märta', N'Ljunquist', N'Nobelvägen 62', N'21215', N'Malmö', N'Sweden', N'marljung@yahoo.it', N'040979797')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (5, N'Robert', N'Fayer', N'Smultronstråket 11', N'12323', N'Farsta', N'Sweden', N'robbyfire@msm.com', N'0762316497')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (6, N'Janina', N'Müller', N'Forskningsvägen 2', N'90638', N'Umeå', N'Sweden', N'janinamuller@ichbin.de', N'0702026978')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (7, N'Pedro', N'Velasquez', N'Gesslegatan 70', N'30261', N'Halmstad', N'Sweden', N'pedro_velasquez@hotmail.se', N'0736974121')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (8, N'Amina', N'Asghar', N'Polartorget 2', N'59791', N'Åtvidaberg', N'Sweden', N'amiina_asghar_84@yahoo.se', N'0704563289')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (9, N'Uno', N'Svenningsson', N'Marsipanvägen 45', N'35258', N'Växjö', N'Sweden', N'unouno@saltsill.com', N'0729875214')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (10, N'Juha', N'Määki', N'Trälgatan 102', N'70510', N'Örebro', N'Sweden', N'juha_1337@suomisoundi.fi', N'0768521498')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (11, N'Anders', N'Persson', N'Rödmålavägen 7', N'22242', N'Lund', N'Sweden', N'anderspersson52@irra.se', N'0701238545')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (12, N'miki', N'string', N'string', N'string', N'string', N'string', N'miki@miki.com', N'string')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (46, N'yahya', N'gfdgf', N'gfdfgdfdfg', N'string', N'string', N'string', N'string', N'string')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (52, N'test111111', N'fdsfdf', N'fdsfsddf', N'324234', N'dwadwa', N'sdfsdf', N'test8@test8.com', N'324234324')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (53, N'', N'', N'', N'', N'', N'', N'test9@test9.com', N'')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (54, N'', N'', N'', N'', N'', N'', N'test10@test10.com', N'')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (55, N'test11', N'test11', N'testgatan', N'20155', N'teststaden', N'sweden', N'test11@test11.com', N'07845465132')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (56, N'', N'', N'', N'', N'', N'', N'test12@test12.com', N'')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (57, N'', N'', N'', N'', N'', N'', N'testtest@gmail.com', N'')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (58, N'', N'', N'', N'', N'', N'', N'testtest@test.se', N'')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (59, N'Mr Test', N'Testare', N'Testvägen', N'11111', N'Testcity', N'testland', N'test123@test.com', N'0721111222')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (60, N'', N'', N'', N'', N'', N'', N'bertil@hej.se', N'')
INSERT [dbo].[Customer] ([Id], [FirstName], [LastName], [Address], [ZipCode], [City], [Country], [Email], [Phone]) VALUES (61, N'', N'', N'', N'', N'', N'', N'test666@test666.com', N'')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Destination] ON 

INSERT [dbo].[Destination] ([Id], [Country], [City]) VALUES (1, N'Spain', N'Malaga')
INSERT [dbo].[Destination] ([Id], [Country], [City]) VALUES (2, N'Spain', N'Marbella')
INSERT [dbo].[Destination] ([Id], [Country], [City]) VALUES (3, N'Greece', N'Mykonos')
INSERT [dbo].[Destination] ([Id], [Country], [City]) VALUES (4, N'Greece', N'Rhodos')
SET IDENTITY_INSERT [dbo].[Destination] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteHotels] ON 

INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (2, 3, 1)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (3, 5, 1)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (4, 2, 2)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (5, 4, 2)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (6, 2, 3)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (7, 3, 3)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (8, 1, 4)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (9, 1, 5)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (10, 2, 5)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (11, 3, 6)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (12, 4, 6)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (13, 3, 7)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (14, 4, 7)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (15, 2, 1)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (16, 4, 1)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (17, 5, 8)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (18, 1, 8)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (19, 2, 9)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (20, 3, 9)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (21, 1, 10)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (22, 3, 10)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (23, 5, 10)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (24, 1, 11)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (25, 2, 11)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (26, 1, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (27, 2, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (28, 2, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (29, 2, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (30, 2, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (31, 5, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (32, 5, 12)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (33, 1, 52)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (34, 4, 52)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (35, 2, 52)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (36, 2, 59)
INSERT [dbo].[FavoriteHotels] ([Id], [HotelId], [CustomerId]) VALUES (37, 5, 52)
SET IDENTITY_INSERT [dbo].[FavoriteHotels] OFF
GO
SET IDENTITY_INSERT [dbo].[Flight] ON 

INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (1, N'EdenExpress', N'Eden', N'Sweden', 1, 2500, 1)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (2, N'KarlstadExpress', N'Karlstad', N'Sweden', 1, 2600, 3)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (3, N'MalmöExpress', N'Malmö', N'Sweden', 1, 2700, 4)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (4, N'ÖrebroExpress', N'Örebro', N'Sweden', 1, 2800, 2)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (5, N'LundExpress', N'Lund', N'Sweden', 1, 2900, 2)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (6, N'ÅtvidabergExpress', N'Åtvidaberg', N'Sweden', 1, 3000, 1)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (7, N'FarstaExpress', N'Farsta', N'Sweden', 1, 3100, 3)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (8, N'UmeåExpress', N'Umeå', N'Sweden', 1, 3200, 4)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (11, N'0', N'0', N'0', 0, 0, 1)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (13, N'0', N'0', N'0', 0, 0, 1)
INSERT [dbo].[Flight] ([Id], [AviatorName], [DepartureCity], [DepartureCountry], [IsReturnFlight], [Price], [DestinationId]) VALUES (14, N'0', N'0', N'0', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Flight] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([Id], [Name], [ZipCode], [Address], [StarRating], [DistanceToBeach], [DistanceToCityCenter], [HasPool], [HasSeaSIde], [HasEntertainment], [HasKIdsClub], [HasRestaurant], [HasHalfPension], [HasWholePension], [HasAllInclusive], [HasWifi], [HasRoomService], [DestinationId], [Description]) VALUES (1, N'Molina Lario Hotel', N'29015', N'Molina Lario 20-22', 4, 2, 4, 1, 1, 0, 0, 1, 1, 1, 0, 1, 1, 1, N'Hotel Molina Lario is a 4 star hotel exceptionally positioned in the centre of Malaga right opposite the Cathedral and just a short distance from the port, the Picasso Museum and the city’s pedestrian district.')
INSERT [dbo].[Hotel] ([Id], [Name], [ZipCode], [Address], [StarRating], [DistanceToBeach], [DistanceToCityCenter], [HasPool], [HasSeaSIde], [HasEntertainment], [HasKIdsClub], [HasRestaurant], [HasHalfPension], [HasWholePension], [HasAllInclusive], [HasWifi], [HasRoomService], [DestinationId], [Description]) VALUES (2, N'Hotel Don Pepe Gran Meliá', N'29602', N'C/. Jose Melia', 5, 0, 5, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 2, N'Located in the heart of the Costa del Sol, at the foot of the privileged natural enclave of Sierra Blanca, the Hotel Don Pepe Gran Meliá is the very best option for visiting and discovering Marbella, thanks to its excellent access to the city centre, its fabulous views, its luxurious and comfortable facilities and the quality of its services.')
INSERT [dbo].[Hotel] ([Id], [Name], [ZipCode], [Address], [StarRating], [DistanceToBeach], [DistanceToCityCenter], [HasPool], [HasSeaSIde], [HasEntertainment], [HasKIdsClub], [HasRestaurant], [HasHalfPension], [HasWholePension], [HasAllInclusive], [HasWifi], [HasRoomService], [DestinationId], [Description]) VALUES (3, N'La Villa Marbella', N'29601', N'Calle Príncipe 10', 1, 6, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 2, N'La Villa Marbella- Old Town   is located in the heart of the Old Town of Marbella, Spain. Our house nearly 200 years old, has been fully refurbished and its rooms decorated in the finest Asian style. The quiet, pedestrian only, streets and the pleasant neighbourhood make the Hotel an oasis of tranquility and comfort,  only 3 minutes walk from the famous Orange Square.')
INSERT [dbo].[Hotel] ([Id], [Name], [ZipCode], [Address], [StarRating], [DistanceToBeach], [DistanceToCityCenter], [HasPool], [HasSeaSIde], [HasEntertainment], [HasKIdsClub], [HasRestaurant], [HasHalfPension], [HasWholePension], [HasAllInclusive], [HasWifi], [HasRoomService], [DestinationId], [Description]) VALUES (4, N'Harmony Boutique Hotel', N'84600', N'Mykonos Town', 4, 1, 4, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 3, N'An exclusive luxurious boutique hotel situated in the heart of Mykonos, just by its port, is the ideal place to enjoy the legendary and cosmopolitan aura of Mykonos. Harmony Boutique Hotel, the most recent jewel of Mykonos island, is an exclusive boutique hotel that portrays authentic Mykonian architecture.')
INSERT [dbo].[Hotel] ([Id], [Name], [ZipCode], [Address], [StarRating], [DistanceToBeach], [DistanceToCityCenter], [HasPool], [HasSeaSIde], [HasEntertainment], [HasKIdsClub], [HasRestaurant], [HasHalfPension], [HasWholePension], [HasAllInclusive], [HasWifi], [HasRoomService], [DestinationId], [Description]) VALUES (5, N'White Palace Studios', N'85105', N'Agisandrou Str. 2', 2, 2, 2, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 4, N'The White Palace Faliraki Studios is a family run complex located in the beautiful settlement of Faliraki in Rhodes. The White Palace studios can accommodate from 2 to 3 people and a 4th child. The accommodation features a swimming pool, baby pool and jacuzzi.
All rooms have satellite LCD 32'' TV,  free air conditioning, free safe deposit box for the guests that book directly from our website, free wifi internet, hair dryer, kitchenette with fridge and balconies with pool view or Garden view.')
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[HotelImage] ON 

INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (1, 1, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/447c582c_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (2, 1, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/9af14a12_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (3, 1, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/38b33d0c_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (4, 1, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/4378a799_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (5, 2, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/79f9823e_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (6, 2, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/41c425b3_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (7, 2, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/31501215_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (8, 2, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/9a42f928_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (9, 3, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/c3e84ec5_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (10, 3, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/31e61624_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (11, 3, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/a56c3c11_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (12, 3, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/9cf00d92_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (13, 4, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/2faa1893_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (14, 4, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/9bbb97f0_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (15, 4, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/f1071a8d_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (16, 4, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/e3afe2b8_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (17, 5, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2f39aa85_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (18, 5, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/da7471d3_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (19, 5, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/cb82068e_z.jpg')
INSERT [dbo].[HotelImage] ([Id], [HotelId], [ImageLink]) VALUES (20, 5, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/1e9c4ac9_z.jpg')
SET IDENTITY_INSERT [dbo].[HotelImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (1, 8, 1, 4, NULL, NULL, N'We stayed at Harmony Boutique Hotel for a few days in November. It’s a great location- just outside of the tiny streets of Mykonos town, but close enough to walk anywhere you need to go! We had a great view of the water, and really enjoyed our stay in the hotel! Our room was clean and comfortable, with a really comfy bed. Angel and Alex were both very helpful in helping us arrange transfers, car rental, and excursions, which was great because we were there in the off season. Would definitely recommend and I would stay there again! ')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (2, 9, 5, 4, NULL, NULL, N'Awesome sea view from the balcony of hotel room. Staffs are friendly. Location is good - Quiet place and just 5 minutes walk to the city centre.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (3, 10, 8, 4, NULL, NULL, N'Chic, trendy hotel. Within walking distance to town. Buffet breakfast included.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (4, 9, 7, 5, NULL, NULL, N'Lungt och bra läge några hundra meter från stranden. Hjärtlig service i receptionen. Pris /standard förmånligt. Vi fick mycket goda tips på stränder och ställen att besöka på ön. Kan tänka mig att att bo där igen.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (5, 8, 2, 2, NULL, NULL, N'Really nice pool area and helpful staff but I would hav expected more from the rooms. Quite small and the standard not the best.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (6, 9, 4, 2, NULL, NULL, N'This was one of the best hotel experiences I have had. Efficient and friendly staff, modern facilities, comfortable and yet luxurious. ')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (7, 9, 5, 3, NULL, NULL, N'Det var jättefina rum! Läget är kanon i ett lugnt område! Service är i världsklass! Vilken härlig personal! Kan starkt rekommenderas för den som vill ha ett bra och prisvärt boende! ')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (8, 9, 9, 3, NULL, NULL, N'From the moment you arrive to the moment you leave the staff cannot do enough for you they are the best hosts I have come across and would not hesitate in going back.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (9, 10, 11, 3, NULL, NULL, N'A lovely property set in the heart of the Old Town near to all of the facilities. Highly recommended')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (10, 8, 4, 1, NULL, NULL, N'Awesome staff, beautiful view, nice location. Would highly recommend and will be back.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (18, 10, 3, 1, N'Hotel', N'Armin', N'Test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (19, 10, 3, 1, N'hotel', N'armin', N'test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (20, 10, 3, 1, N'hotel', N'armin', N'Test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (21, 10, 3, 1, N'hotel', N'Armin', N'test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (22, 10, 3, 1, N'hotel', N'Armin', N'test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (23, 9, 3, 1, N'hotel', N'armin', N'test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (24, 9, 1, 3, N'hotel', N'armin', N'test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (25, 9, 1, 3, N'hotel', N'armin', N'test')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (26, 10, 3, 1, N'hotel', N'armin', N'Testing')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (31, 10, 3, 1, N'hotel', N'armin', N'Testing')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (32, 10, 3, 1, N'hotel', N'armin', N'testing')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (33, 10, 3, 1, N'Hotel', N'armin', N'Testing')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (35, 1, 9, 2, NULL, N'Dino Papadopulos', N'I hated this hotel. It smelled like wet dog and the staff hurt my feelings. I am planning to sue.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (36, 3, 10, 2, NULL, N'Diana Kenobi', N'I was unimpressed. The Force was not strong with this one.')
INSERT [dbo].[Reviews] ([Id], [Rating], [CustomerId], [HotelId], [Heading], [Name], [ReviewText]) VALUES (37, 5, 12, 2, NULL, N'Jorge Llucas', N'I disagree with Diana. I thought this hotel was quite nice. Would have appreciated an open bar though...')
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (1, 1, 11001, 1, 1, NULL, 1)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (2, 1, 11002, 2, 1, NULL, 1)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (3, 1, 11003, 3, 0, NULL, 1)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (4, 1, 12001, 1, 1, NULL, 2)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (5, 1, 12002, 2, 1, NULL, 2)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (6, 1, 12003, 3, 0, NULL, 2)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (7, 1, 13001, 1, 1, NULL, 3)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (8, 1, 13002, 2, 1, NULL, 3)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (9, 1, 13003, 3, 0, NULL, 3)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (10, 2, 21001, 1, 1, NULL, 4)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (11, 2, 21002, 2, 1, NULL, 4)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (12, 2, 21003, 3, 0, NULL, 4)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (13, 2, 22001, 1, 1, NULL, 5)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (14, 2, 22002, 2, 1, NULL, 5)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (15, 2, 22003, 3, 0, NULL, 5)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (16, 2, 23001, 1, 1, NULL, 6)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (17, 2, 23002, 2, 1, NULL, 6)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (18, 2, 23003, 3, 0, NULL, 6)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (19, 3, 31001, 1, 1, NULL, 7)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (20, 3, 31002, 2, 1, NULL, 7)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (21, 3, 31003, 3, 0, NULL, 7)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (22, 3, 32001, 1, 1, NULL, 8)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (23, 3, 32002, 2, 1, NULL, 8)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (24, 3, 32003, 3, 0, NULL, 8)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (25, 3, 33001, 1, 1, NULL, 9)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (26, 3, 33002, 2, 1, NULL, 9)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (27, 3, 33003, 3, 0, NULL, 9)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (28, 4, 41001, 1, 1, NULL, 10)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (29, 4, 41002, 2, 1, NULL, 10)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (30, 4, 41003, 3, 0, NULL, 11)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (31, 4, 42001, 1, 1, NULL, 11)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (32, 4, 42002, 2, 1, NULL, 11)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (33, 4, 42003, 3, 0, NULL, 12)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (34, 4, 43001, 1, 1, NULL, 12)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (35, 4, 43002, 2, 1, NULL, 12)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (36, 4, 43003, 3, 0, NULL, 12)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (37, 5, 51001, 1, 1, NULL, 13)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (38, 5, 51002, 2, 1, NULL, 13)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (39, 5, 51003, 3, 0, NULL, 13)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (40, 5, 52001, 1, 1, NULL, 14)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (41, 5, 52002, 2, 1, NULL, 14)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (42, 5, 52003, 3, 0, NULL, 14)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (43, 5, 53001, 1, 1, NULL, 15)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (44, 5, 53002, 2, 1, NULL, 15)
INSERT [dbo].[Room] ([Id], [HotelId], [RoomNo], [NoOfSpareBeds], [IsSelfCleaning], [IsOccupied], [RoomTypeId]) VALUES (45, 5, 53003, 3, 0, NULL, 15)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomImage] ON 

INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (1, 1, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/d5422cdf_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (2, 2, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/914ab001_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (3, 3, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/399f56bf_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (4, 4, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/d5422cdf_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (5, 5, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/914ab001_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (6, 6, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/399f56bf_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (7, 7, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/d5422cdf_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (8, 8, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/914ab001_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (9, 9, N'https://exp.cdn-hotels.com/hotels/2000000/1410000/1400100/1400064/399f56bf_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (10, 10, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/98705039_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (11, 11, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/03e72a86_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (12, 12, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/a89a2e11_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (13, 13, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/98705039_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (14, 14, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/03e72a86_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (15, 15, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/a89a2e11_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (16, 16, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/98705039_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (17, 17, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/03e72a86_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (18, 18, N'https://exp.cdn-hotels.com/hotels/2000000/1920000/1916100/1916074/a89a2e11_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (19, 19, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2aeff7e0_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (20, 20, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/c6cedc8b_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (21, 21, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/3ee97856_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (22, 22, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2aeff7e0_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (23, 23, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/c6cedc8b_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (24, 24, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/3ee97856_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (25, 25, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/2aeff7e0_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (26, 26, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/c6cedc8b_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (27, 27, N'https://exp.cdn-hotels.com/hotels/3000000/2430000/2424700/2424602/3ee97856_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (28, 28, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/66c7db4d_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (29, 29, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/5691c899_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (30, 30, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/a7b3dd9f_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (31, 31, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/66c7db4d_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (32, 32, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/5691c899_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (33, 33, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/a7b3dd9f_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (34, 34, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/66c7db4d_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (35, 35, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/5691c899_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (36, 36, N'https://exp.cdn-hotels.com/hotels/1000000/530000/525800/525749/a7b3dd9f_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (37, 37, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/0d212496_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (38, 38, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/3ef83082_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (39, 39, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/49cb80f1_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (40, 40, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/0d212496_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (41, 41, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/3ef83082_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (42, 42, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/49cb80f1_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (43, 43, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/0d212496_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (44, 44, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/3ef83082_z.jpg')
INSERT [dbo].[RoomImage] ([Id], [RoomId], [ImageLink]) VALUES (45, 45, N'https://exp.cdn-hotels.com/hotels/3000000/2530000/2529000/2528934/49cb80f1_z.jpg')
SET IDENTITY_INSERT [dbo].[RoomImage] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (1, N'Standard', 2, 567)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (2, N'Superior', 4, 765)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (3, N'Suite', 6, 879)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (4, N'Standard', 2, 576)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (5, N'Superior', 4, 659)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (6, N'Suite', 6, 899)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (7, N'Standard', 2, 456)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (8, N'Superior', 4, 654)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (9, N'Suite', 6, 897)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (10, N'Standard', 2, 687)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (11, N'Superior', 4, 887)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (12, N'Suite', 6, 1003)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (13, N'Standard', 2, 1165)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (14, N'Superior', 4, 1342)
INSERT [dbo].[RoomTypes] ([Id], [TypeName], [Capacity], [Price]) VALUES (15, N'Suite', 6, 1580)
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D105348BD2FB31]    Script Date: 21-06-09 15:35:04 ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UQ__Customer__A9D105348BD2FB31] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_FirstName]  DEFAULT ('') FOR [FirstName]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_LastName]  DEFAULT ('') FOR [LastName]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Address]  DEFAULT ('') FOR [Address]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_ZipCode]  DEFAULT ('') FOR [ZipCode]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_City]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Country]  DEFAULT ('') FOR [Country]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Phone]  DEFAULT ('') FOR [Phone]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__Custome__7B5B524B] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__Custome__7B5B524B]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK__Booking__FlightI__7A672E12] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK__Booking__FlightI__7A672E12]
GO
ALTER TABLE [dbo].[bookingXroom]  WITH CHECK ADD  CONSTRAINT [FK__bookingXr__Booki__7F2BE32F] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([Id])
GO
ALTER TABLE [dbo].[bookingXroom] CHECK CONSTRAINT [FK__bookingXr__Booki__7F2BE32F]
GO
ALTER TABLE [dbo].[bookingXroom]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER TABLE [dbo].[FavoriteHotels]  WITH CHECK ADD  CONSTRAINT [FK__FavoriteH__Custo__71D1E811] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[FavoriteHotels] CHECK CONSTRAINT [FK__FavoriteH__Custo__71D1E811]
GO
ALTER TABLE [dbo].[FavoriteHotels]  WITH CHECK ADD FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Flight]  WITH CHECK ADD FOREIGN KEY([DestinationId])
REFERENCES [dbo].[Destination] ([Id])
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD FOREIGN KEY([DestinationId])
REFERENCES [dbo].[Destination] ([Id])
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__Custome__6D0D32F4] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__Custome__6D0D32F4]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
GO
ALTER TABLE [dbo].[RoomImage]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([Id])
GO
ALTER DATABASE [HolidayMaker5] SET  READ_WRITE 
GO
