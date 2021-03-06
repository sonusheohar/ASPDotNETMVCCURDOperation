USE [master]
GO
/****** Object:  Database [ProgramminTechLiveSessionDB]    Script Date: 7/14/2021 5:03:01 PM ******/
CREATE DATABASE [ProgramminTechLiveSessionDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProgramminTechLiveSessionDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProgramminTechLiveSessionDB.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProgramminTechLiveSessionDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ProgramminTechLiveSessionDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProgramminTechLiveSessionDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ProgramminTechLiveSessionDB]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/14/2021 5:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Email] [varchar](150) NOT NULL,
	[Address] [varchar](500) NULL,
	[DOB] [datetime] NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Email], [Address], [DOB], [CreatedBy], [CreatedOn]) VALUES (1, N'Sonu Kumar Singh', N'sonu@yopmail.com', N'Pune', CAST(N'2021-07-03 16:40:00.000' AS DateTime), N'Rohin', CAST(N'2021-07-03 15:36:16.187' AS DateTime))
INSERT [dbo].[Students] ([Id], [Name], [Email], [Address], [DOB], [CreatedBy], [CreatedOn]) VALUES (2, N'Dharam', N'dharam@yopmail.com', N'UP', CAST(N'2021-07-03 15:36:16.187' AS DateTime), N'Sonu', CAST(N'2021-07-03 15:36:16.187' AS DateTime))
INSERT [dbo].[Students] ([Id], [Name], [Email], [Address], [DOB], [CreatedBy], [CreatedOn]) VALUES (3, N'Naitik', N'Natik@yopmail.com', N'DElhi', CAST(N'2021-07-03 15:36:16.187' AS DateTime), N'Sonu', CAST(N'2021-07-03 15:36:16.187' AS DateTime))
INSERT [dbo].[Students] ([Id], [Name], [Email], [Address], [DOB], [CreatedBy], [CreatedOn]) VALUES (6, N'John', N'john@yopmail.com', N'Delhi', CAST(N'2021-07-03 16:06:00.000' AS DateTime), N'Laksmi', CAST(N'2021-07-03 16:06:31.307' AS DateTime))
SET IDENTITY_INSERT [dbo].[Students] OFF
/****** Object:  StoredProcedure [dbo].[usp_AddStudentInfo]    Script Date: 7/14/2021 5:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_AddStudentInfo] 
	@Name VARCHAR(200),
	@Email VARCHAR(150),
	@Address VARCHAR(500),
	@DOB VARCHAR(500),
	@CreatedBy VARCHAR(500)
AS
BEGIN
	INSERT INTO Students
	(
		 Name
		,Email
		,Address
		,DOB
		,CreatedBy
	)
	VALUES
	(
		 @Name
		,@Email
		,@Address
		,@DOB
		,@CreatedBy
	)
END

GO
/****** Object:  StoredProcedure [dbo].[usp_DeleteStudentInfoById]    Script Date: 7/14/2021 5:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_DeleteStudentInfoById] 
	@Id int
AS
BEGIN
	Delete FROM Students WHERE Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[usp_GetStudentList]    Script Date: 7/14/2021 5:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_GetStudentList]
	
AS
BEGIN
	SELECT * FROM Students
END

GO
/****** Object:  StoredProcedure [dbo].[usp_StudentInfoById]    Script Date: 7/14/2021 5:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_StudentInfoById]  
	@Id int
AS
BEGIN
	SELECT * FROM Students WHERE Id=@Id
END

GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateStudentInfo]    Script Date: 7/14/2021 5:03:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_UpdateStudentInfo] 
	@Id INT,
	@Name VARCHAR(200),
	@Email VARCHAR(150),
	@Address VARCHAR(500),
	@DOB VARCHAR(500),
	@CreatedBy VARCHAR(500) 
	
AS
BEGIN
	
		 Update students SET
			NAME=@Name,
			Email=@Email,
			[Address]=@Address,
			DOB=@DOB,
			CreatedBy=@CreatedBy WHERE Id=@Id
END

GO
USE [master]
GO
ALTER DATABASE [ProgramminTechLiveSessionDB] SET  READ_WRITE 
GO
