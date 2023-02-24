USE [animal-chipization]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 24/02/2023 17:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](320) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animal]    Script Date: 24/02/2023 17:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animal](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Weight] [real] NOT NULL,
	[Length] [real] NOT NULL,
	[Height] [real] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
	[LifeStatus] [nvarchar](50) NOT NULL,
	[ChipperId] [int] NOT NULL,
	[ChippingDateTime] [datetime] NOT NULL,
	[ChippingLocationId] [bigint] NOT NULL,
	[DeathDateTime] [datetime] NULL,
 CONSTRAINT [PK_Animal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalKind]    Script Date: 24/02/2023 17:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalKind](
	[AnimalId] [bigint] NOT NULL,
	[KindId] [bigint] NOT NULL,
 CONSTRAINT [PK_AnimalType] PRIMARY KEY CLUSTERED 
(
	[AnimalId] ASC,
	[KindId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kind]    Script Date: 24/02/2023 17:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kind](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 24/02/2023 17:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VisitedLocation]    Script Date: 24/02/2023 17:59:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitedLocation](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[AnimalId] [bigint] NOT NULL,
	[VisitDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_VisitedLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Account] FOREIGN KEY([ChipperId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Account]
GO
ALTER TABLE [dbo].[Animal]  WITH CHECK ADD  CONSTRAINT [FK_Animal_Location] FOREIGN KEY([ChippingLocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[Animal] CHECK CONSTRAINT [FK_Animal_Location]
GO
ALTER TABLE [dbo].[AnimalKind]  WITH CHECK ADD  CONSTRAINT [FK_AnimalType_Animal] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[AnimalKind] CHECK CONSTRAINT [FK_AnimalType_Animal]
GO
ALTER TABLE [dbo].[AnimalKind]  WITH CHECK ADD  CONSTRAINT [FK_AnimalType_Type] FOREIGN KEY([KindId])
REFERENCES [dbo].[Kind] ([Id])
GO
ALTER TABLE [dbo].[AnimalKind] CHECK CONSTRAINT [FK_AnimalType_Type]
GO
ALTER TABLE [dbo].[VisitedLocation]  WITH CHECK ADD  CONSTRAINT [FK_VisitedLocation_Animal] FOREIGN KEY([AnimalId])
REFERENCES [dbo].[Animal] ([Id])
GO
ALTER TABLE [dbo].[VisitedLocation] CHECK CONSTRAINT [FK_VisitedLocation_Animal]
GO
ALTER TABLE [dbo].[VisitedLocation]  WITH CHECK ADD  CONSTRAINT [FK_VisitedLocation_Location] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
ALTER TABLE [dbo].[VisitedLocation] CHECK CONSTRAINT [FK_VisitedLocation_Location]
GO
USE [master]
GO
ALTER DATABASE [animal-chipization] SET  READ_WRITE 
GO
