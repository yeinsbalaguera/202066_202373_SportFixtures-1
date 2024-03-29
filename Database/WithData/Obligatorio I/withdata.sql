CREATE DATABASE [SportFixturesTest]
GO
ALTER DATABASE [SportFixturesTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportFixturesTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportFixturesTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportFixturesTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportFixturesTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportFixturesTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportFixturesTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportFixturesTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportFixturesTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportFixturesTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportFixturesTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportFixturesTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportFixturesTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportFixturesTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportFixturesTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportFixturesTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportFixturesTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportFixturesTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportFixturesTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportFixturesTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportFixturesTest] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SportFixturesTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportFixturesTest] SET RECOVERY FULL 
GO
ALTER DATABASE [SportFixturesTest] SET  MULTI_USER 
GO
ALTER DATABASE [SportFixturesTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportFixturesTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportFixturesTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportFixturesTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportFixturesTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SportFixturesTest', N'ON'
GO
USE [SportFixturesTest]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/10/2018 10:16:36 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 10/10/2018 10:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[EncounterId] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encounters]    Script Date: 10/10/2018 10:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encounters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[SportId] [int] NOT NULL,
	[Team1Id] [int] NULL,
	[Team2Id] [int] NULL,
 CONSTRAINT [PK_Encounters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sports]    Script Date: 10/10/2018 10:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 10/10/2018 10:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[SportId] [int] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/10/2018 10:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Role] [int] NOT NULL,
	[Token] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 10/10/2018 10:16:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTeams](
	[UserId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_UsersTeams] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180910232610_InitialCreate', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180930222632_Update with all entities', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181003041428_Added many-to-many relationship', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181010045035_Removed IsDeleted', N'2.1.4-rtm-31024')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20181010210032_Seed data and cascade delete for comments', N'2.1.4-rtm-31024')
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (1, 3, 3, N'Good game, well played')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (2, 5, 5, N'Good game, well played')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (3, 5, 5, N'Good game, well played')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (4, 5, 5, N'Awful!')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (5, 4, 4, N'Great!')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (6, 4, 4, N'GG!')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Encounters] ON 

INSERT [dbo].[Encounters] ([Id], [Date], [SportId], [Team1Id], [Team2Id]) VALUES (1, CAST(N'2017-09-08T19:04:14.0000000' AS DateTime2), 1, 10, 9)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId], [Team1Id], [Team2Id]) VALUES (2, CAST(N'2018-09-08T19:04:14.0000000' AS DateTime2), 1, 10, 9)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId], [Team1Id], [Team2Id]) VALUES (3, CAST(N'2018-09-09T19:04:14.0000000' AS DateTime2), 1, 10, 9)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId], [Team1Id], [Team2Id]) VALUES (4, CAST(N'2018-10-10T02:02:28.0000000' AS DateTime2), 3, 14, 15)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId], [Team1Id], [Team2Id]) VALUES (5, CAST(N'2018-10-12T02:02:28.0000000' AS DateTime2), 3, 16, 17)
SET IDENTITY_INSERT [dbo].[Encounters] OFF
SET IDENTITY_INSERT [dbo].[Sports] ON 

INSERT [dbo].[Sports] ([Id], [Name]) VALUES (1, N'Futbol')
INSERT [dbo].[Sports] ([Id], [Name]) VALUES (2, N'Basquetbol')
INSERT [dbo].[Sports] ([Id], [Name]) VALUES (3, N'Hockey')
SET IDENTITY_INSERT [dbo].[Sports] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (3, N'Danubio', N'C:\path\photo.jpg', 1)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (4, N'Aguada', N'C:\b\aguada.jpg', 2)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (5, N'Atenas', N'C:\b\atenas.jpg', 2)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (6, N'Nacional', N'C:\b\nacional.jpg', 2)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (9, N'Peñarol', N'C:\f\peniarol.jpg', 1)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (10, N'Nacional', N'C:\f\nacional.jpg', 1)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (11, N'HockeyClub', N'C:\h\clubies.jpg', 3)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (12, N'TheHockies', N'C:\h\thh.jpg', 3)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (13, N'hielo', N'C:\h\freeze.jpg', 3)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (14, N'HockeyClub', N'C:\h\clubies.jpg', 3)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (15, N'TheHockies', N'C:\h\thh.jpg', 3)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (16, N'TheHockies', N'C:\h\thh.jpg', 3)
INSERT [dbo].[Teams] ([Id], [Name], [PhotoPath], [SportId]) VALUES (17, N'hielo', N'C:\h\freeze.jpg', 3)
SET IDENTITY_INSERT [dbo].[Teams] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (1, N'Admins Name', N'Admins LastName', N'admin', N'admin', N'admin@admin.com', 1, N'28f73d41-8583-42d0-a1ec-5306765a40a2')
INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (2, N'Normal user', N'Users LastName', N'user', N'user', N'user@user.com', 0, NULL)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (4, N'admin2', N'Gonzalez', N'admin2', N'admin2', N'admin2@admin2.com', 1, N'1c5ad73e-225d-48d1-a3ee-d6ff8be913da')
INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (5, N'user2', N'Perez', N'user2', N'user2', N'user2@user2.com', 0, N'34452135-e3b6-4be5-b41f-c79021f5b88e')
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (5, 9)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (2, 10)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (5, 10)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 11)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 12)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (4, 13)
/****** Object:  Index [IX_Comments_UserId]    Script Date: 10/10/2018 10:16:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Encounters_Team1Id]    Script Date: 10/10/2018 10:16:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Encounters_Team1Id] ON [dbo].[Encounters]
(
	[Team1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Encounters_Team2Id]    Script Date: 10/10/2018 10:16:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Encounters_Team2Id] ON [dbo].[Encounters]
(
	[Team2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teams_SportId]    Script Date: 10/10/2018 10:16:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_Teams_SportId] ON [dbo].[Teams]
(
	[SportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersTeams_TeamId]    Script Date: 10/10/2018 10:16:36 PM ******/
CREATE NONCLUSTERED INDEX [IX_UsersTeams_TeamId] ON [dbo].[UsersTeams]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT ((0)) FOR [SportId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Encounters_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Encounters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Encounters_UserId]
GO
ALTER TABLE [dbo].[Encounters]  WITH CHECK ADD  CONSTRAINT [FK_Encounters_Teams_Team1Id] FOREIGN KEY([Team1Id])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Encounters] CHECK CONSTRAINT [FK_Encounters_Teams_Team1Id]
GO
ALTER TABLE [dbo].[Encounters]  WITH CHECK ADD  CONSTRAINT [FK_Encounters_Teams_Team2Id] FOREIGN KEY([Team2Id])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[Encounters] CHECK CONSTRAINT [FK_Encounters_Teams_Team2Id]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Sports_SportId] FOREIGN KEY([SportId])
REFERENCES [dbo].[Sports] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Sports_SportId]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Teams_TeamId]
GO
ALTER TABLE [dbo].[UsersTeams]  WITH CHECK ADD  CONSTRAINT [FK_UsersTeams_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UsersTeams] CHECK CONSTRAINT [FK_UsersTeams_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [SportFixturesTest] SET  READ_WRITE 
GO
