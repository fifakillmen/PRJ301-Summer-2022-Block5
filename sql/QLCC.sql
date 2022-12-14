USE [master]
GO
/****** Object:  Database [QuanLyChamCong]    Script Date: 27/9/2022 11:30:34 AM ******/
CREATE DATABASE [QuanLyChamCong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyChamCong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyChamCong.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyChamCong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\QuanLyChamCong_log.ldf' , SIZE = 1515520KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [QuanLyChamCong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyChamCong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyChamCong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyChamCong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyChamCong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyChamCong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyChamCong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyChamCong] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyChamCong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyChamCong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyChamCong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyChamCong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyChamCong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyChamCong] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuanLyChamCong] SET QUERY_STORE = OFF
GO
USE [QuanLyChamCong]
GO
/****** Object:  Table [dbo].[attendence]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendence](
	[attendId] [int] IDENTITY(1,1) NOT NULL,
	[Erollnumber] [varchar](10) NOT NULL,
	[day] [date] NOT NULL,
	[conventionRoll] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[attendenceOvertime]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[attendenceOvertime](
	[attendoverId] [int] IDENTITY(1,1) NOT NULL,
	[Erollnumber] [varchar](10) NOT NULL,
	[day] [date] NOT NULL,
	[conventionRoll] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Base salary]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Base salary](
	[BasesalaryId] [int] NOT NULL,
	[baseValue] [float] NOT NULL,
 CONSTRAINT [PK_Base salary] PRIMARY KEY CLUSTERED 
(
	[BasesalaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[coefficients salary]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coefficients salary](
	[coefficientsId] [int] NOT NULL,
	[levelSalary] [float] NOT NULL,
 CONSTRAINT [PK_coefficients salary] PRIMARY KEY CLUSTERED 
(
	[coefficientsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[conventionAttendence]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conventionAttendence](
	[conventionRoll] [varchar](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[amountWork] [float] NOT NULL,
	[BHXH] [bit] NOT NULL,
 CONSTRAINT [PK_conventionAttendence] PRIMARY KEY CLUSTERED 
(
	[conventionRoll] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Erollnumber] [varchar](10) NOT NULL,
	[fullname] [nvarchar](150) NOT NULL,
	[gender] [bit] NOT NULL,
	[birthday] [date] NOT NULL,
	[coefficientsId] [int] NOT NULL,
	[BasesalaryId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Erollnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Festival]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Festival](
	[FesId] [int] NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Festival] PRIMARY KEY CLUSTERED 
(
	[FesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IsleavingWork]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IsleavingWork](
	[leaveWorkId] [int] NOT NULL,
	[reason] [nvarchar](150) NOT NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[IsAccepted] [bit] NULL,
	[Erollnumber] [varchar](10) NULL,
 CONSTRAINT [PK_IsleavingWork] PRIMARY KEY CLUSTERED 
(
	[leaveWorkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monthlySalary]    Script Date: 27/9/2022 11:30:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monthlySalary](
	[Erollnumber] [varchar](10) NOT NULL,
	[coefficientsId] [int] NOT NULL,
	[BasesalaryId] [int] NOT NULL,
	[Salary] [float] NOT NULL,
	[amount work over time] [float] NOT NULL,
 CONSTRAINT [PK_monthlySalary] PRIMARY KEY CLUSTERED 
(
	[Erollnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[attendence]  WITH CHECK ADD  CONSTRAINT [FK_attendence_conventionAttendence] FOREIGN KEY([conventionRoll])
REFERENCES [dbo].[conventionAttendence] ([conventionRoll])
GO
ALTER TABLE [dbo].[attendence] CHECK CONSTRAINT [FK_attendence_conventionAttendence]
GO
ALTER TABLE [dbo].[attendence]  WITH CHECK ADD  CONSTRAINT [FK_attendence_Employee] FOREIGN KEY([Erollnumber])
REFERENCES [dbo].[Employee] ([Erollnumber])
GO
ALTER TABLE [dbo].[attendence] CHECK CONSTRAINT [FK_attendence_Employee]
GO
ALTER TABLE [dbo].[attendenceOvertime]  WITH CHECK ADD  CONSTRAINT [FK_attendenceOvertime_Employee] FOREIGN KEY([Erollnumber])
REFERENCES [dbo].[Employee] ([Erollnumber])
GO
ALTER TABLE [dbo].[attendenceOvertime] CHECK CONSTRAINT [FK_attendenceOvertime_Employee]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Base salary] FOREIGN KEY([BasesalaryId])
REFERENCES [dbo].[Base salary] ([BasesalaryId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Base salary]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_coefficients salary1] FOREIGN KEY([coefficientsId])
REFERENCES [dbo].[coefficients salary] ([coefficientsId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_coefficients salary1]
GO
ALTER TABLE [dbo].[IsleavingWork]  WITH CHECK ADD  CONSTRAINT [FK_IsleavingWork_Employee] FOREIGN KEY([Erollnumber])
REFERENCES [dbo].[Employee] ([Erollnumber])
GO
ALTER TABLE [dbo].[IsleavingWork] CHECK CONSTRAINT [FK_IsleavingWork_Employee]
GO
ALTER TABLE [dbo].[monthlySalary]  WITH CHECK ADD  CONSTRAINT [FK_monthlySalary_Base salary] FOREIGN KEY([BasesalaryId])
REFERENCES [dbo].[Base salary] ([BasesalaryId])
GO
ALTER TABLE [dbo].[monthlySalary] CHECK CONSTRAINT [FK_monthlySalary_Base salary]
GO
ALTER TABLE [dbo].[monthlySalary]  WITH CHECK ADD  CONSTRAINT [FK_monthlySalary_coefficients salary] FOREIGN KEY([coefficientsId])
REFERENCES [dbo].[coefficients salary] ([coefficientsId])
GO
ALTER TABLE [dbo].[monthlySalary] CHECK CONSTRAINT [FK_monthlySalary_coefficients salary]
GO
ALTER TABLE [dbo].[monthlySalary]  WITH CHECK ADD  CONSTRAINT [FK_monthlySalary_Employee] FOREIGN KEY([Erollnumber])
REFERENCES [dbo].[Employee] ([Erollnumber])
GO
ALTER TABLE [dbo].[monthlySalary] CHECK CONSTRAINT [FK_monthlySalary_Employee]
GO
USE [master]
GO
ALTER DATABASE [QuanLyChamCong] SET  READ_WRITE 
GO
