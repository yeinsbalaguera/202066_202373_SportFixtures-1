USE [SportFixturesTest]
GO
ALTER TABLE [dbo].[UsersTeams] DROP CONSTRAINT [FK_UsersTeams_Users_UserId]
GO
ALTER TABLE [dbo].[UsersTeams] DROP CONSTRAINT [FK_UsersTeams_Teams_TeamId]
GO
ALTER TABLE [dbo].[Teams] DROP CONSTRAINT [FK_Teams_Sports_SportId]
GO
ALTER TABLE [dbo].[PositionInEncounter] DROP CONSTRAINT [FK_PositionInEncounter_Encounters_EncounterId]
GO
ALTER TABLE [dbo].[EncountersTeams] DROP CONSTRAINT [FK_EncountersTeams_Teams_TeamId]
GO
ALTER TABLE [dbo].[EncountersTeams] DROP CONSTRAINT [FK_EncountersTeams_Encounters_EncounterId]
GO
ALTER TABLE [dbo].[Comments] DROP CONSTRAINT [FK_Comments_Encounters_UserId]
GO
/****** Object:  Index [IX_UsersTeams_TeamId]    Script Date: 22/11/2018 19:41:58 ******/
DROP INDEX [IX_UsersTeams_TeamId] ON [dbo].[UsersTeams]
GO
/****** Object:  Index [IX_Teams_SportId]    Script Date: 22/11/2018 19:41:58 ******/
DROP INDEX [IX_Teams_SportId] ON [dbo].[Teams]
GO
/****** Object:  Index [IX_PositionInEncounter_EncounterId]    Script Date: 22/11/2018 19:41:58 ******/
DROP INDEX [IX_PositionInEncounter_EncounterId] ON [dbo].[PositionInEncounter]
GO
/****** Object:  Index [IX_EncountersTeams_TeamId]    Script Date: 22/11/2018 19:41:58 ******/
DROP INDEX [IX_EncountersTeams_TeamId] ON [dbo].[EncountersTeams]
GO
/****** Object:  Index [IX_Comments_UserId]    Script Date: 22/11/2018 19:41:58 ******/
DROP INDEX [IX_Comments_UserId] ON [dbo].[Comments]
GO
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[UsersTeams]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[Teams]
GO
/****** Object:  Table [dbo].[Sports]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[Sports]
GO
/****** Object:  Table [dbo].[PositionInEncounter]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[PositionInEncounter]
GO
/****** Object:  Table [dbo].[EncountersTeams]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[EncountersTeams]
GO
/****** Object:  Table [dbo].[Encounters]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[Encounters]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[Comments]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/11/2018 19:41:58 ******/
DROP TABLE [dbo].[__EFMigrationsHistory]
GO
/****** Object:  User [IIS APPPOOL\super]    Script Date: 22/11/2018 19:41:58 ******/
DROP USER [IIS APPPOOL\super]
GO
USE [master]
GO
/****** Object:  Database [SportFixturesTest]    Script Date: 22/11/2018 19:41:58 ******/
DROP DATABASE [SportFixturesTest]
GO
/****** Object:  Database [SportFixturesTest]    Script Date: 22/11/2018 19:41:58 ******/
CREATE DATABASE [SportFixturesTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportFixturesTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER_R14\MSSQL\DATA\SportFixturesTest.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SportFixturesTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER_R14\MSSQL\DATA\SportFixturesTest_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SportFixturesTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportFixturesTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
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
ALTER DATABASE [SportFixturesTest] SET  ENABLE_BROKER 
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
USE [SportFixturesTest]
GO
/****** Object:  User [IIS APPPOOL\super]    Script Date: 22/11/2018 19:41:59 ******/
CREATE USER [IIS APPPOOL\super] FOR LOGIN [IIS APPPOOL\super] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\super]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22/11/2018 19:41:59 ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 22/11/2018 19:41:59 ******/
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
/****** Object:  Table [dbo].[Encounters]    Script Date: 22/11/2018 19:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encounters](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[SportId] [int] NOT NULL,
 CONSTRAINT [PK_Encounters] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EncountersTeams]    Script Date: 22/11/2018 19:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EncountersTeams](
	[EncounterId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_EncountersTeams] PRIMARY KEY CLUSTERED 
(
	[EncounterId] ASC,
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PositionInEncounter]    Script Date: 22/11/2018 19:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PositionInEncounter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[Position] [int] NOT NULL,
	[EncounterId] [int] NULL,
 CONSTRAINT [PK_PositionInEncounter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sports]    Script Date: 22/11/2018 19:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[EncounterMode] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Sports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teams]    Script Date: 22/11/2018 19:41:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Photo] [nvarchar](max) NULL,
	[SportId] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 22/11/2018 19:41:59 ******/
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
/****** Object:  Table [dbo].[UsersTeams]    Script Date: 22/11/2018 19:41:59 ******/
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
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (1, 1, 1, N'Good game')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (2, 2, 2, N'This is a comment')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (3, 1, 1, N'User comment')
INSERT [dbo].[Comments] ([Id], [UserId], [EncounterId], [Text]) VALUES (4, 2, 2, N'Another user comment')
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Encounters] ON 

INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (1, CAST(N'2018-11-22 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (2, CAST(N'2018-11-23 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (3, CAST(N'2018-11-24 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (4, CAST(N'2019-01-17 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (5, CAST(N'2019-01-18 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (6, CAST(N'2019-01-19 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (7, CAST(N'2019-01-20 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (8, CAST(N'2019-01-21 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (9, CAST(N'2019-01-22 03:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (10, CAST(N'2018-12-19 03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (11, CAST(N'2018-12-20 03:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (12, CAST(N'2018-11-23 03:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (13, CAST(N'2018-11-29 03:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[Encounters] ([Id], [Date], [SportId]) VALUES (14, CAST(N'2018-11-30 03:00:00.0000000' AS DateTime2), 3)
SET IDENTITY_INSERT [dbo].[Encounters] OFF
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (10, 1)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (11, 1)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (10, 2)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (11, 2)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (1, 3)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (2, 3)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (4, 3)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (5, 3)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (6, 3)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (7, 3)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (1, 4)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (3, 4)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (4, 4)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (5, 4)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (8, 4)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (9, 4)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (2, 5)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (3, 5)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (6, 5)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (7, 5)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (8, 5)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (9, 5)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (12, 6)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (13, 6)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (14, 6)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (12, 7)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (13, 7)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (12, 8)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (13, 8)
INSERT [dbo].[EncountersTeams] ([EncounterId], [TeamId]) VALUES (14, 8)
SET IDENTITY_INSERT [dbo].[Sports] ON 

INSERT [dbo].[Sports] ([Id], [Name], [EncounterMode]) VALUES (1, N'Futbol', 0)
INSERT [dbo].[Sports] ([Id], [Name], [EncounterMode]) VALUES (2, N'Basquetbol', 0)
INSERT [dbo].[Sports] ([Id], [Name], [EncounterMode]) VALUES (3, N'Golf', 1)
SET IDENTITY_INSERT [dbo].[Sports] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (1, N'Aguada', NULL, 2)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (2, N'Atenas', NULL, 2)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (3, N'Nacional', NULL, 1)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (4, N'Peñarol', NULL, 1)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (5, N'Danubio', NULL, 1)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (6, N'Golferman', NULL, 3)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (7, N'PedroGolf', NULL, 3)
INSERT [dbo].[Teams] ([Id], [Name], [Photo], [SportId]) VALUES (8, N'Marcos Golfer', NULL, 3)
SET IDENTITY_INSERT [dbo].[Teams] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (1, N'admin', N'admin', N'admin', N'admin', N'admin@admin.com', 1, NULL)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (2, N'user', N'user', N'user', N'user', N'user@user.com', 0, NULL)
INSERT [dbo].[Users] ([Id], [Name], [LastName], [Username], [Password], [Email], [Role], [Token]) VALUES (3, N'Pedro', N'Perez', N'pedroperez', N'pedroperez', N'pedro@perez.com', 0, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 1)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (2, 1)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (3, 1)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 2)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (3, 2)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 3)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (3, 3)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 4)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (2, 4)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (3, 4)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 5)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (2, 5)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (3, 5)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 6)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 7)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (1, 8)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (2, 8)
INSERT [dbo].[UsersTeams] ([UserId], [TeamId]) VALUES (3, 8)
/****** Object:  Index [IX_Comments_UserId]    Script Date: 22/11/2018 19:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_UserId] ON [dbo].[Comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EncountersTeams_TeamId]    Script Date: 22/11/2018 19:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_EncountersTeams_TeamId] ON [dbo].[EncountersTeams]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PositionInEncounter_EncounterId]    Script Date: 22/11/2018 19:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_PositionInEncounter_EncounterId] ON [dbo].[PositionInEncounter]
(
	[EncounterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Teams_SportId]    Script Date: 22/11/2018 19:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_Teams_SportId] ON [dbo].[Teams]
(
	[SportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsersTeams_TeamId]    Script Date: 22/11/2018 19:41:59 ******/
CREATE NONCLUSTERED INDEX [IX_UsersTeams_TeamId] ON [dbo].[UsersTeams]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Encounters_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Encounters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Encounters_UserId]
GO
ALTER TABLE [dbo].[EncountersTeams]  WITH CHECK ADD  CONSTRAINT [FK_EncountersTeams_Encounters_EncounterId] FOREIGN KEY([EncounterId])
REFERENCES [dbo].[Encounters] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EncountersTeams] CHECK CONSTRAINT [FK_EncountersTeams_Encounters_EncounterId]
GO
ALTER TABLE [dbo].[EncountersTeams]  WITH CHECK ADD  CONSTRAINT [FK_EncountersTeams_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EncountersTeams] CHECK CONSTRAINT [FK_EncountersTeams_Teams_TeamId]
GO
ALTER TABLE [dbo].[PositionInEncounter]  WITH CHECK ADD  CONSTRAINT [FK_PositionInEncounter_Encounters_EncounterId] FOREIGN KEY([EncounterId])
REFERENCES [dbo].[Encounters] ([Id])
GO
ALTER TABLE [dbo].[PositionInEncounter] CHECK CONSTRAINT [FK_PositionInEncounter_Encounters_EncounterId]
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
