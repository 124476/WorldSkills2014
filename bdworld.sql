USE [master]
GO
/****** Object:  Database [WorldSkills]    Script Date: 13.12.2023 19:18:35 ******/
CREATE DATABASE [WorldSkills]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldSkills', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WorldSkills.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WorldSkills_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\WorldSkills_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WorldSkills] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldSkills].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldSkills] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldSkills] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldSkills] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldSkills] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldSkills] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldSkills] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldSkills] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldSkills] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldSkills] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldSkills] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldSkills] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldSkills] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldSkills] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldSkills] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldSkills] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldSkills] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldSkills] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldSkills] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldSkills] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldSkills] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldSkills] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldSkills] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldSkills] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorldSkills] SET  MULTI_USER 
GO
ALTER DATABASE [WorldSkills] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldSkills] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldSkills] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldSkills] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WorldSkills] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WorldSkills] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WorldSkills] SET QUERY_STORE = ON
GO
ALTER DATABASE [WorldSkills] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WorldSkills]
GO
/****** Object:  Table [dbo].[ChatMessage]    Script Date: 13.12.2023 19:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender_Id] [int] NULL,
	[Chatroom_Id] [int] NULL,
	[Date] [datetime] NULL,
	[Message] [text] NULL,
 CONSTRAINT [PK_ChatMessage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chatroom]    Script Date: 13.12.2023 19:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chatroom](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Topic] [nvarchar](100) NULL,
 CONSTRAINT [PK_Chatroom] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatroomMember]    Script Date: 13.12.2023 19:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatroomMember](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [int] NULL,
	[Chatroom_Id] [int] NULL,
 CONSTRAINT [PK_ChatroomMember] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 13.12.2023 19:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.12.2023 19:18:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Department_Id] [int] NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChatMessage] ON 

INSERT [dbo].[ChatMessage] ([Id], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (1, 101, 6, CAST(N'2023-12-13T17:45:48.760' AS DateTime), N'test')
INSERT [dbo].[ChatMessage] ([Id], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (2, 101, 10, CAST(N'2023-12-13T18:47:46.263' AS DateTime), N'ok''')
INSERT [dbo].[ChatMessage] ([Id], [Sender_Id], [Chatroom_Id], [Date], [Message]) VALUES (3, 102, 13, CAST(N'2023-12-13T18:48:24.557' AS DateTime), N'hi''')
SET IDENTITY_INSERT [dbo].[ChatMessage] OFF
GO
SET IDENTITY_INSERT [dbo].[Chatroom] ON 

INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (1, N'df')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (2, N'1 - Phelan Mckee')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (3, N'1 - Aspen Tucker')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (4, N'1 - Aspen Tucker')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (5, N'1 - Zachery Woodward')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (6, N'1 - Cecilia Joyce')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (7, N'1 - Aspen Tucker')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (8, N'1 - Cecilia Joyce')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (9, N'1 - Noelle Peters')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (10, N'1 - Jamalia Valenzuela')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (11, N'1 - Ariel Moss')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (12, N'1 - Ariel Moss')
INSERT [dbo].[Chatroom] ([Id], [Topic]) VALUES (13, N'2 - 1')
SET IDENTITY_INSERT [dbo].[Chatroom] OFF
GO
SET IDENTITY_INSERT [dbo].[ChatroomMember] ON 

INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (1, 1, 1)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (2, 101, 1)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (3, 11, 2)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (4, 101, 2)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (5, 3, 3)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (6, 101, 3)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (7, 3, 4)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (8, 101, 4)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (9, 8, 5)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (10, 101, 5)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (11, 18, 1)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (12, 1, 6)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (13, 101, 6)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (16, 1, 8)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (17, 101, 8)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (18, 2, 9)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (19, 101, 9)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (20, 5, 10)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (21, 101, 10)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (22, 10, 11)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (23, 101, 11)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (24, 10, 12)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (25, 101, 12)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (26, 101, 13)
INSERT [dbo].[ChatroomMember] ([Id], [Employee_Id], [Chatroom_Id]) VALUES (27, 102, 13)
SET IDENTITY_INSERT [dbo].[ChatroomMember] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (2, N'IT Helpdesk')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (3, N'Engineering')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (4, N'Sales')
INSERT [dbo].[Department] ([Id], [Name]) VALUES (5, N'Marketing')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (1, N'Cecilia Joyce', 1, N'cjoyce', N'cejoyce10')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (2, N'Noelle Peters', 1, N'npeters', N'noeters76')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (3, N'Aspen Tucker', 1, N'atucker', N'asucker95')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (4, N'Isadora Kirby', 1, N'ikirby', N'iskirby86')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (5, N'Jamalia Valenzuela', 1, N'jvalenzuela', N'jazuela67')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (6, N'Keely Dickson', 1, N'kdickson', N'keckson95')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (7, N'Sandra Riggs', 1, N'sriggs', N'sariggs41')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (8, N'Zachery Woodward', 1, N'zwoodward', N'zadward1')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (9, N'Emi Owen', 1, N'eowen', N'em owen9')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (10, N'Ariel Moss', 1, N'amoss', N'ar moss35')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (11, N'Phelan Mckee', 1, N'pmckee', N'phmckee27')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (12, N'Uta Cooper', 2, N'ucooper', N'utooper36')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (13, N'Iris Holden', 2, N'iholden', N'irolden2')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (14, N'Faith Cameron', 2, N'fcameron', N'fameron19')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (15, N'Renee Mosley', 2, N'rmosley', N'reosley3')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (16, N'Dana Martin', 2, N'dmartin', N'daartin89')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (17, N'Martin Larson', 2, N'mlarson', N'maarson53')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (18, N'Quinlan Mays', 2, N'qmays', N'qu mays50')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (19, N'Kelly Blackwell', 2, N'kblackwell', N'kekwell30')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (20, N'Madonna Weber', 2, N'mweber', N'maweber66')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (21, N'Jael Roberson', 2, N'jroberson', N'jaerson89')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (22, N'Anastasia Peters', 2, N'apeters', N'aneters83')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (23, N'Carol Aguilar', 2, N'caguilar', N'cauilar38')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (24, N'Alexandra Hobbs', 2, N'ahobbs', N'alhobbs32')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (25, N'Myles Golden', 2, N'mgolden', N'myolden27')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (26, N'Marny Thomas', 2, N'mthomas', N'mahomas53')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (27, N'Aline Curtis', 2, N'acurtis', N'alurtis44')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (28, N'Sade Nielsen', 2, N'snielsen', N'saelsen93')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (29, N'Halla Velez', 2, N'hvelez', N'havelez31')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (30, N'Kiara Joseph', 3, N'kjoseph', N'kioseph22')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (31, N'Stacy Wilkinson', 3, N'swilkinson', N'stinson81')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (32, N'Bevis York', 3, N'byork', N'be york64')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (33, N'Nita Santos', 3, N'nsantos', N'niantos52')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (34, N'Connor Fleming', 3, N'cfleming', N'coeming29')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (35, N'Steel Rosario', 3, N'srosario', N'stsario44')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (36, N'Mariam Mullen', 3, N'mmullen', N'maullen21')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (37, N'Blaine Patrick', 3, N'bpatrick', N'bltrick53')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (38, N'Meredith Simpson', 3, N'msimpson', N'mempson73')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (39, N'Noel Sutton', 3, N'nsutton', N'noutton25')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (40, N'Deacon Mullins', 3, N'dmullins', N'dellins57')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (41, N'Kirby England', 3, N'kengland', N'kigland62')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (42, N'Pandora Morris', 3, N'pmorris', N'paorris6')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (43, N'Magee Ayala', 3, N'mayala', N'maayala12')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (44, N'Caleb Jarvis', 3, N'cjarvis', N'caarvis9')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (45, N'Oleg Juarez', 3, N'ojuarez', N'oluarez77')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (46, N'Doris Woodward', 3, N'dwoodward', N'dodward71')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (47, N'Simon Robinson', 3, N'srobinson', N'siinson63')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (48, N'Kuame Bond', 3, N'kbond', N'ku bond52')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (49, N'Courtney Black', 3, N'cblack', N'coblack27')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (50, N'Warren Knox', 3, N'wknox', N'wa knox44')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (51, N'Macon Rodgers', 3, N'mrodgers', N'madgers90')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (52, N'Merrill Lane', 3, N'mlane', N'me lane65')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (53, N'Nero Franks', 3, N'nfranks', N'neranks41')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (54, N'Malcolm Edwards', 3, N'medwards', N'mawards33')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (55, N'Cade Rodgers', 3, N'crodgers', N'cadgers46')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (56, N'Yvonne Singleton', 3, N'ysingleton', N'yvleton70')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (57, N'Shellie Mckee', 3, N'smckee', N'shmckee15')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (58, N'Brandon Hart', 3, N'bhart', N'br hart63')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (59, N'Cullen Mack', 3, N'cmack', N'cu mack18')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (60, N'Hall Grimes', 3, N'hgrimes', N'harimes11')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (61, N'Lev Cleveland', 3, N'lcleveland', N'leeland38')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (62, N'Driscoll Klein', 3, N'dklein', N'drklein97')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (63, N'Giselle Reeves', 3, N'greeves', N'gieeves78')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (64, N'Dominique Emerson', 3, N'demerson', N'doerson18')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (65, N'Sloane Hobbs', 3, N'shobbs', N'slhobbs83')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (66, N'Yvonne Castillo', 3, N'ycastillo', N'yvtillo48')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (67, N'Iona Collins', 3, N'icollins', N'iollins36')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (68, N'Indira Wolfe', 3, N'iwolfe', N'inwolfe8')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (69, N'Chava Good', 3, N'cgood', N'ch good40')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (70, N'Calista Hodges', 3, N'chodges', N'caodges79')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (71, N'Oleg Delacruz', 3, N'odelacruz', N'olacruz98')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (72, N'Yvonne Wright', 3, N'ywright', N'yvright28')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (73, N'Kimberley Berry', 3, N'kberry', N'kiberry82')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (74, N'Jacob Mccullough', 3, N'jmccullough', N'jalough92')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (75, N'Lucian Palmer', 3, N'lpalmer', N'lualmer67')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (76, N'Bell Phillips', 3, N'bphillips', N'bellips69')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (77, N'Arthur Jordan', 3, N'ajordan', N'arordan63')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (78, N'Leonard Rich', 3, N'lrich', N'le rich1')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (79, N'Joelle Clemons', 4, N'jclemons', N'joemons27')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (80, N'Zephania Roy', 4, N'zroy', N'zea roy22')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (81, N'Nadine Hernandez', 4, N'nhernandez', N'naandez68')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (82, N'Anika Pope', 4, N'apope', N'an pope82')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (83, N'Denton Randall', 4, N'drandall', N'dendall20')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (84, N'Remedios Merritt', 4, N'rmerritt', N'rerritt34')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (85, N'Fulton Hale', 4, N'fhale', N'fu hale36')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (86, N'Christen Bryan', 4, N'cbryan', N'chbryan75')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (87, N'Gillian Castillo', 4, N'gcastillo', N'gitillo15')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (88, N'Katelyn Patel', 4, N'kpatel', N'kapatel51')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (89, N'Clare Hayden', 4, N'chayden', N'clayden21')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (90, N'Kirby Roach', 5, N'kroach', N'kiroach71')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (91, N'Tana Colon', 5, N'tcolon', N'tacolon86')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (92, N'Gretchen Hancock', 5, N'ghancock', N'grncock57')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (93, N'Judith Leonard', 5, N'jleonard', N'juonard45')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (94, N'Amaya Brady', 5, N'abrady', N'ambrady38')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (95, N'Alice Torres', 5, N'atorres', N'alorres57')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (96, N'Marny Oconnor', 5, N'moconnor', N'maonnor74')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (97, N'Sonia Cantu', 5, N'scantu', N'socantu85')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (98, N'Cathleen Wiley', 5, N'cwiley', N'cawiley44')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (99, N'Rajah Sanchez', 5, N'rsanchez', N'ranchez32')
GO
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (100, N'Declan Arnold', 5, N'darnold', N'dernold19')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (101, N'1', 1, N'1', N'1')
INSERT [dbo].[Employee] ([Id], [Name], [Department_Id], [Username], [Password]) VALUES (102, N'2', 2, N'2', N'2')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
ALTER TABLE [dbo].[ChatMessage]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessage_Chatroom] FOREIGN KEY([Chatroom_Id])
REFERENCES [dbo].[Chatroom] ([Id])
GO
ALTER TABLE [dbo].[ChatMessage] CHECK CONSTRAINT [FK_ChatMessage_Chatroom]
GO
ALTER TABLE [dbo].[ChatMessage]  WITH CHECK ADD  CONSTRAINT [FK_ChatMessage_Employee] FOREIGN KEY([Sender_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ChatMessage] CHECK CONSTRAINT [FK_ChatMessage_Employee]
GO
ALTER TABLE [dbo].[ChatroomMember]  WITH CHECK ADD  CONSTRAINT [FK_ChatroomMember_Chatroom] FOREIGN KEY([Chatroom_Id])
REFERENCES [dbo].[Chatroom] ([Id])
GO
ALTER TABLE [dbo].[ChatroomMember] CHECK CONSTRAINT [FK_ChatroomMember_Chatroom]
GO
ALTER TABLE [dbo].[ChatroomMember]  WITH CHECK ADD  CONSTRAINT [FK_ChatroomMember_Employee] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ChatroomMember] CHECK CONSTRAINT [FK_ChatroomMember_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department_Id])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
USE [master]
GO
ALTER DATABASE [WorldSkills] SET  READ_WRITE 
GO
