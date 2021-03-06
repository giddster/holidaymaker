/****** Object:  Database [HolidayMakerIdentityDb]    Script Date: 21-06-09 15:33:52 ******/
CREATE DATABASE [HolidayMakerIdentityDb]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET  MULTI_USER 
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET ENCRYPTION ON
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET QUERY_STORE = ON
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 21-06-09 15:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210605103040_InitialApplicationDbContextAzure', N'5.0.5')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'1c684ce7-a1d8-455e-b605-ed6a8f60919f', N'test6@test6.com', N'TEST6@TEST6.COM', N'test6@test6.com', N'TEST6@TEST6.COM', 0, N'AQAAAAEAACcQAAAAEHDs5Po2LpRGyatwnuFFCSsmSzzDVR+sEGlaygM6hgMJ2HERwgbXd//QMY67s0Aluw==', N'NBTI5YWVLCUA6NUWFRFEBF2DVYXVRMR4', N'244eaa07-f262-4496-ae7f-7827b06d27ae', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'28617f54-e071-489f-a643-cc2608f290cb', N'store@rawcapital.se', N'STORE@RAWCAPITAL.SE', N'store@rawcapital.se', N'STORE@RAWCAPITAL.SE', 0, N'AQAAAAEAACcQAAAAEMMD4/F5W2AJGZWn4X0EbYkFTvWKVQ6HqAA7rSfEgKHZ9YqYlX4GQFUOFrPT94FGbA==', N'FWE37ZQX2DLKFEL3S3A24HBIX4YBESBB', N'd2f639df-9fc4-4db3-b4d3-0b0abb9f1120', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'3e0f53b8-d0b9-42c0-a0bb-c0cec0f66ab4', N'test12@test12.com', N'TEST12@TEST12.COM', N'test12@test12.com', N'TEST12@TEST12.COM', 0, N'AQAAAAEAACcQAAAAEA0vu+HDbqO81C7CMYZBKG1Y3l8wlQtws02EcYzUidF+qm7JeqiDRLxrzfm9UqsaQw==', N'5J7U63FTIRXZHSN24627LMPOIYPFHTFL', N'f82e41e5-cf84-4077-846b-d320d018adfa', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'41218b0d-e5ba-4195-8eef-b441a045e993', N'store1@rawcapital.se', N'STORE1@RAWCAPITAL.SE', N'store1@rawcapital.se', N'STORE1@RAWCAPITAL.SE', 0, N'AQAAAAEAACcQAAAAEJSmbFBq3YLFzj50qw9HJK6dIpT/r5fjHFhjaH1KruSYxlbl1KLXUFqQmZjVhlhNjA==', N'QGBRUAJP5F3YCWVCZSYVTDVR3BU2PESB', N'933da1ec-8e24-4917-89ac-d7cae8c04b34', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'417a9d0c-7d2f-475e-9c8e-21447159b011', N'test15@test15.com', N'TEST15@TEST15.COM', N'test15@test15.com', N'TEST15@TEST15.COM', 0, N'AQAAAAEAACcQAAAAEBdYK5M/ssRa+RImadFgrLkusInHC8QRKgT4KSwkZp4/Xq4L/UZrsTjTBbWHTY7OAg==', N'GNH42DVL5UXCTY44MHMYVRGTF75UAIDH', N'46d5458b-1205-4637-ba6e-018ec6ed6e7e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'424c8750-fadc-4ad4-8d33-071620c7aa8d', N'test666@test666.com', N'TEST666@TEST666.COM', N'test666@test666.com', N'TEST666@TEST666.COM', 0, N'AQAAAAEAACcQAAAAEN5VGLtdIdn+ze14B0qhJjQepgPyziXEGpcpqk+JOgfLFTUpQUOJIxE6eXdmjKnozA==', N'FVZBHMUBFNDA3GE3HZZYWZ62ZIUMHNHU', N'7566a423-76eb-409b-af34-698df11f84e9', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'42cfdfb2-49ff-45f0-b904-e8a68b0fad48', N'test10@test10.com', N'TEST10@TEST10.COM', N'test10@test10.com', N'TEST10@TEST10.COM', 0, N'AQAAAAEAACcQAAAAENoMmL4i10sizjeCfpVOChM6yS58e3kEwcQOJp5qL/M/44S3pmo8XUTL+rKzkxtcYw==', N'HECVQZ57VN7F4LFN7KCDZW7FICHNXDGN', N'8928218a-9833-4106-93dc-2a9f485e20bb', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'446ad036-373f-4555-90a9-1f84740b550c', N'test30@test30.com', N'TEST30@TEST30.COM', N'test30@test30.com', N'TEST30@TEST30.COM', 0, N'AQAAAAEAACcQAAAAEC6JzkQS81i0Mne2b9Ob4ycN34s/kwlg6fKPKv9j4libFq3CCqGcSXB0zzPI9iUy7w==', N'4PBIP3OHSI34WEVHLZ4G2E4BROTTN3LV', N'e664a57b-a789-42fc-a890-16fb1bb78f8a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5d93363d-8227-4259-97bf-6bb923342af0', N'test5@test5.com', N'TEST5@TEST5.COM', N'test5@test5.com', N'TEST5@TEST5.COM', 0, N'AQAAAAEAACcQAAAAEFGoV0bWAUXrwkxSaw4WZYDol3Oy1paXbf5zEjHtwfrS0iBNQ0lyLWL8liaUzfkLEA==', N'IWRP2DMOHRSO32BHCYIHUSQENAXIOHUO', N'cadf8c6a-935e-4d70-9d84-4cd717e3c258', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8095ec80-1401-414b-b1f7-62a5fd17f414', N'test11@test11.com', N'TEST11@TEST11.COM', N'test11@test11.com', N'TEST11@TEST11.COM', 0, N'AQAAAAEAACcQAAAAEJKBdYZ+VQaP6tyEi6784cmcpV2J0KIIgl5BwinnWHu+AOcYiZBkAqCFenUdcIJp2g==', N'IBMQMUPL52YTGRPDJAHITQX2E57JYG6B', N'5541f421-764f-48f6-81ce-388569ece24e', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'861dffc5-4fec-45ac-ab70-46199ff96b6f', N'bertil@hej.se', N'BERTIL@HEJ.SE', N'bertil@hej.se', N'BERTIL@HEJ.SE', 0, N'AQAAAAEAACcQAAAAELst9yoF4BcaKuo/G8DEcLkugjGt0G5iobgkjYGTT0okmFvWolPaaxuyajqw231eFg==', N'VMC2LD3RIFW56HAWVIS47YYI3NDYF63A', N'b9f54b33-6c0f-470c-a08c-9c5d6020e9e8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8ac7d815-b0d1-41d5-9703-cfdeaea04801', N'test@test.com', N'TEST@TEST.COM', N'test@test.com', N'TEST@TEST.COM', 0, N'AQAAAAEAACcQAAAAEF2rNMMDX9nqIW8QoVGap/h0NNni3QYngg0KkNMWdsyFYt9v4VrU4GHGYsmPgT2CTQ==', N'CQILSWWF5I27GVU652USJBBCCTZ7QEIC', N'ac43d615-fa6d-44ac-adc1-836857e5811b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'8efa5f31-f9c7-4b22-ac8f-368f8bf09be3', N'test4@test4.com', N'TEST4@TEST4.COM', N'test4@test4.com', N'TEST4@TEST4.COM', 0, N'AQAAAAEAACcQAAAAEHhVQg7swzG3CpLnGd71DT8/b0VegJXUex3Cc1x2BT8cVV7vtHKUYOaX8c43e1eRQA==', N'2MIDDOWLZUKPTJBI5CG4SC7JYUNDCXNM', N'0712feac-42f6-44d7-8267-5ac95a8c940f', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a1566100-58b8-4604-898e-42aa4beec852', N'test8@test8.com', N'TEST8@TEST8.COM', N'test8@test8.com', N'TEST8@TEST8.COM', 0, N'AQAAAAEAACcQAAAAEJzgTSC4LNrL5lIDnX+FQzJd6tMmN7wExXFy8uDUF4iRB3fG0e6hEdgk8Ly7hTbQcQ==', N'T7YUQPSSDXW567Y6CFPL5IKG6H36YFQ7', N'f3432c71-5d4c-40e4-b79d-057989e138cf', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'a3e8f7a4-44e3-4d20-b1d9-fc5904280f1d', N'testtest@test.se', N'TESTTEST@TEST.SE', N'testtest@test.se', N'TESTTEST@TEST.SE', 0, N'AQAAAAEAACcQAAAAEKZa1ol+lTK0ySnLE4wI4qlyT/Cy1pspHEsPAnioa0eRVSpAYe6hbLD0IdV6NYr+Ug==', N'W5BTZWFKYCWHPS5C637OZ26GVVQIGFQT', N'e3bb24b0-19f8-40b7-802f-d5188ee2eb67', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c2bf0bb7-fde8-4bda-be04-ae05129beaec', N'testtest@gmail.com', N'TESTTEST@GMAIL.COM', N'testtest@gmail.com', N'TESTTEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELMb3ueQM/RflFmBS3dEG0dir7Za2mkjthsgRZLorlxXV0zS2r1xHpEI7B265T8XxQ==', N'WFJW5VAVV7FOOYSD7XJSNMNZKJVD5XPL', N'af3b0236-4cc9-4144-8026-3a9d7517f382', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c800a3a1-6f45-430f-a506-2e1030575466', N'test123@test.com', N'TEST123@TEST.COM', N'test123@test.com', N'TEST123@TEST.COM', 0, N'AQAAAAEAACcQAAAAEOBQYVTKbgQByQGYjGKAiaGasBEeF08wE0kyf98Owp7VhdE6ThmebX74AUn9WYyj4g==', N'YYVEU2FPEQGMUVHXPHCEG7SLMGSMMKGZ', N'dd59b199-85eb-4dcb-afb8-7f35fa1fa301', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'dc0b31e9-e87e-4de8-a54c-ee27d7915a6a', N'test9@test9.com', N'TEST9@TEST9.COM', N'test9@test9.com', N'TEST9@TEST9.COM', 0, N'AQAAAAEAACcQAAAAEN+R7LwtjwiSiV6ZwCDkVEMhHJR8qOd9gbWkgSfIc5VTxqHFgk99W/8cINLx4ON5fg==', N'TJOWDCXRRM5ZCYH4532U7TNSNXB3NT7A', N'6d562f48-90ba-40cd-9857-0363ea94ef9c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e6fb2125-85b2-4c05-89d4-adfcac5dffdf', N'test7@test7.com', N'TEST7@TEST7.COM', N'test7@test7.com', N'TEST7@TEST7.COM', 0, N'AQAAAAEAACcQAAAAEMwA1ytME9sXsn7yNbozymYLpEhlwcweVujiQ8damkeKEhw7MApKXGBLY5G+SHCbxw==', N'GSFPPQGA74XZXGVYDRF6P25XDEBX2OAN', N'f4fe6838-53d0-4d33-b31b-d42296279032', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e936f61f-1d67-4581-94ae-697ec0395575', N'testaren12@hotmail.com', N'TESTAREN12@HOTMAIL.COM', N'testaren12@hotmail.com', N'TESTAREN12@HOTMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOhB1rzCYASUiudP+V67hKanEB/tkyxm7egg/LMlWb2WS2u1SHYPuc7kS0NJyYUd1A==', N'42GWIFYN4FYN2B4TRXC5MBPJ3ATA6UCI', N'c0340043-65e6-4262-acb2-36d10cc96aa8', NULL, 0, 0, NULL, 1, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 21-06-09 15:33:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 21-06-09 15:33:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 21-06-09 15:33:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 21-06-09 15:33:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 21-06-09 15:33:53 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 21-06-09 15:33:53 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 21-06-09 15:33:53 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER DATABASE [HolidayMakerIdentityDb] SET  READ_WRITE 
GO
