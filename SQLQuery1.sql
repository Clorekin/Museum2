
CREATE DATABASE [Museum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Museum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Museum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Museum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Museum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Museum] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Museum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Museum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Museum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Museum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Museum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Museum] SET ARITHABORT OFF 
GO
ALTER DATABASE [Museum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Museum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Museum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Museum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Museum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Museum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Museum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Museum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Museum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Museum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Museum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Museum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Museum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Museum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Museum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Museum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Museum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Museum] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Museum] SET  MULTI_USER 
GO
ALTER DATABASE [Museum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Museum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Museum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Museum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Museum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Museum] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Museum] SET QUERY_STORE = OFF
GO
USE [Museum]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID_Client] [int] NOT NULL,
	[First Name] [varchar](50) NULL,
	[SecondName] [varchar](50) NULL,
	[Last Name] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID_Employee] [int] NOT NULL,
	[Full_Name] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[ID_Hall] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excursion]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excursion](
	[ID_Excursion] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[Date] [date] NULL,
	[ID_Client] [int] NULL,
	[ID_Guide] [int] NULL,
 CONSTRAINT [PK_Excursion] PRIMARY KEY CLUSTERED 
(
	[ID_Excursion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exhibit]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exhibit](
	[ID_Exhibit] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[ID_Hall] [int] NULL,
 CONSTRAINT [PK_Exhibit] PRIMARY KEY CLUSTERED 
(
	[ID_Exhibit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guide]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guide](
	[ID_Guide] [int] NOT NULL,
	[Full_Name] [varchar](50) NULL,
	[ID_Employee] [int] NULL,
 CONSTRAINT [PK_Guide] PRIMARY KEY CLUSTERED 
(
	[ID_Guide] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hall]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hall](
	[ID_Hall] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[ID_Excursion] [int] NULL,
 CONSTRAINT [PK_Hall] PRIMARY KEY CLUSTERED 
(
	[ID_Hall] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[Excursion] [varchar](50) NOT NULL,
	[Guide] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 25.12.2022 20:35:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Role] [int] NOT NULL,
	[Login] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
 CONSTRAINT [PK__Users__3214EC276E15B1D6] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (1, N'Никита', N'Ветров', N'Сергеевич', N'79945334511', N'testv@mail.com')
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (2, N'Евгений', N'Завенин', N'Валерьевич', N'79227418845', N'testz@mail.com')
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (3, N'Николай', N'Глазов', N'Дмитриевич', N'79821441661', N'testg@mail.com')
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (4, N'Илья', N'Дровин', N'Алексеевич', N'79848188552', N'testd@mail.com')
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (5, N'Жанна', N'Голубова', N'Нурсултановна', N'79177247172', N'testgo@mail.com')
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (6, N'Нурсултан', N'Глазов', N'Денисович', N'79001446212', N'testgl@mail.com')
GO
INSERT [dbo].[Client] ([ID_Client], [First Name], [SecondName], [Last Name], [Phone], [Email]) VALUES (7, N'Данила', N'Тазов', N'Александрович', N'79991624561', N'testt@mail.com')
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (1, N'Иванов С.Н', N'Уборщик', 4)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (2, N'Пафнутьев Е.Д', N'Администратор', 3)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (3, N'Руков Ж.С', N'Экскурсовод', 6)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (4, N'Романов Р.Д', N'Билетер', 1)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (5, N'Жуков О.О', N'Уборщик', 2)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (6, N'Чехов Н.В', N'Экскурсовод', 2)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (7, N'Вахов М.П', N'Экскурсовод', 3)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (8, N'Троицкий М.П', N'Охранник', NULL)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (9, N'Носов В.Б', N'Уборщик', 6)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (10, N'Другов М.Б', N'Уборщик', 5)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (11, N'Жиров Н.Г', N'Экскурсовод', 4)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (12, N'Горин Г.В', N'Экскурсовод', 5)
GO
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Role], [ID_Hall]) VALUES (13, N'Левин Д.В', N'Экскурсовод', 1)
GO
INSERT [dbo].[Excursion] ([ID_Excursion], [Name], [Date], [ID_Client], [ID_Guide]) VALUES (1, N'В гости к предкам', CAST(N'2022-07-10' AS Date), 1, 6)
GO
INSERT [dbo].[Excursion] ([ID_Excursion], [Name], [Date], [ID_Client], [ID_Guide]) VALUES (2, N'Путешествие на глубину', CAST(N'2022-09-27' AS Date), 5, 4)
GO
INSERT [dbo].[Excursion] ([ID_Excursion], [Name], [Date], [ID_Client], [ID_Guide]) VALUES (3, N'Дедушкина оранжерея', CAST(N'2022-01-13' AS Date), 3, 1)
GO
INSERT [dbo].[Excursion] ([ID_Excursion], [Name], [Date], [ID_Client], [ID_Guide]) VALUES (4, N'Зубастый досмотр', CAST(N'2022-05-01' AS Date), 2, 3)
GO
INSERT [dbo].[Excursion] ([ID_Excursion], [Name], [Date], [ID_Client], [ID_Guide]) VALUES (5, N'С высоты древнего полета', CAST(N'2021-11-29' AS Date), 6, 2)
GO
INSERT [dbo].[Excursion] ([ID_Excursion], [Name], [Date], [ID_Client], [ID_Guide]) VALUES (6, N'Древний текстиль', CAST(N'2022-08-17' AS Date), 4, 5)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (1, N'Череп Симлодона', 5)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (2, N'Скелет Homo Habilis', 1)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (3, N'Аммониты', 5)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (4, N'Ископаемые древних рыб', 3)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (5, N'Скелет динозавра Tyrannosaurus Rex', 1)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (6, N'Ископаемые древних птиц', 2)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (7, N'Скелет крокодила рода Deinosuchus', 4)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (8, N'Ископаемые растения', 6)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (9, N'Челюсть акулы семейства Carcharocles megalodon', 3)
GO
INSERT [dbo].[Exhibit] ([ID_Exhibit], [Name], [ID_Hall]) VALUES (10, N'Череп Мамонта', 4)
GO
INSERT [dbo].[Guide] ([ID_Guide], [Full_Name], [ID_Employee]) VALUES (1, N'Руков Ж.С', 3)
GO
INSERT [dbo].[Guide] ([ID_Guide], [Full_Name], [ID_Employee]) VALUES (2, N'Чехов Н.В', 6)
GO
INSERT [dbo].[Guide] ([ID_Guide], [Full_Name], [ID_Employee]) VALUES (3, N'Вахов М.П', 7)
GO
INSERT [dbo].[Guide] ([ID_Guide], [Full_Name], [ID_Employee]) VALUES (4, N'Жиров Н.Г', 11)
GO
INSERT [dbo].[Guide] ([ID_Guide], [Full_Name], [ID_Employee]) VALUES (5, N'Горин Г.В', 12)
GO
INSERT [dbo].[Guide] ([ID_Guide], [Full_Name], [ID_Employee]) VALUES (6, N'Левин Д.В', 13)
GO
INSERT [dbo].[Hall] ([ID_Hall], [Name], [ID_Excursion]) VALUES (1, N'Зал доисторического дуэта', 1)
GO
INSERT [dbo].[Hall] ([ID_Hall], [Name], [ID_Excursion]) VALUES (2, N'Зал ископаемых птиц', 5)
GO
INSERT [dbo].[Hall] ([ID_Hall], [Name], [ID_Excursion]) VALUES (3, N'Зал древнего подводного мира', 2)
GO
INSERT [dbo].[Hall] ([ID_Hall], [Name], [ID_Excursion]) VALUES (4, N'Зал зубастой встречи', 4)
GO
INSERT [dbo].[Hall] ([ID_Hall], [Name], [ID_Excursion]) VALUES (5, N'Зал ископаемых останков', 6)
GO
INSERT [dbo].[Hall] ([ID_Hall], [Name], [ID_Excursion]) VALUES (6, N'Зал доисторической флоры', 3)
GO
SET IDENTITY_INSERT [dbo].[Registration] ON 
GO
INSERT [dbo].[Registration] ([ID], [FullName], [Date], [Excursion], [Guide]) VALUES (5, N'lllmmlmm', CAST(N'2022-12-08' AS Date), N'Путешествие на глубину', N'Чехов Н.В')
GO
INSERT [dbo].[Registration] ([ID], [FullName], [Date], [Excursion], [Guide]) VALUES (6, N'Грибов А.А', CAST(N'2022-12-02' AS Date), N'Древний текстиль', N'Левин Д.В')
GO
SET IDENTITY_INSERT [dbo].[Registration] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([ID], [ID_Role], [Login], [Password]) VALUES (1, 1, N'admin', N'admin')
GO
INSERT [dbo].[Users] ([ID], [ID_Role], [Login], [Password]) VALUES (2, 2, N'test', N'111')
GO
INSERT [dbo].[Users] ([ID], [ID_Role], [Login], [Password]) VALUES (3, 0, N'user', N'ff23')
GO
INSERT [dbo].[Users] ([ID], [ID_Role], [Login], [Password]) VALUES (4, 0, N'nikita', N'333')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Hall] FOREIGN KEY([ID_Hall])
REFERENCES [dbo].[Hall] ([ID_Hall])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Hall]
GO
ALTER TABLE [dbo].[Excursion]  WITH CHECK ADD  CONSTRAINT [FK_Excursion_Client] FOREIGN KEY([ID_Client])
REFERENCES [dbo].[Client] ([ID_Client])
GO
ALTER TABLE [dbo].[Excursion] CHECK CONSTRAINT [FK_Excursion_Client]
GO
ALTER TABLE [dbo].[Excursion]  WITH CHECK ADD  CONSTRAINT [FK_Excursion_Guide] FOREIGN KEY([ID_Guide])
REFERENCES [dbo].[Guide] ([ID_Guide])
GO
ALTER TABLE [dbo].[Excursion] CHECK CONSTRAINT [FK_Excursion_Guide]
GO
ALTER TABLE [dbo].[Exhibit]  WITH CHECK ADD  CONSTRAINT [FK_Exhibit_Hall] FOREIGN KEY([ID_Hall])
REFERENCES [dbo].[Hall] ([ID_Hall])
GO
ALTER TABLE [dbo].[Exhibit] CHECK CONSTRAINT [FK_Exhibit_Hall]
GO
ALTER TABLE [dbo].[Guide]  WITH CHECK ADD  CONSTRAINT [FK_Guide_Employee] FOREIGN KEY([ID_Employee])
REFERENCES [dbo].[Employee] ([ID_Employee])
GO
ALTER TABLE [dbo].[Guide] CHECK CONSTRAINT [FK_Guide_Employee]
GO
ALTER TABLE [dbo].[Hall]  WITH CHECK ADD  CONSTRAINT [FK_Hall_Excursion] FOREIGN KEY([ID_Excursion])
REFERENCES [dbo].[Excursion] ([ID_Excursion])
GO
ALTER TABLE [dbo].[Hall] CHECK CONSTRAINT [FK_Hall_Excursion]
GO
USE [master]
GO
ALTER DATABASE [Museum] SET  READ_WRITE 
GO
