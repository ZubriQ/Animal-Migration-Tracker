USE [animal-chipization]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'John', N'Doe', N'john@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'John', N'White', N'john2@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (5, N'Razor', N'Blade', N'razor@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (6, N'Inna', N'Hammer', N'inna@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (7, N'Richard', N'Smith', N'rich@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (8, N'Inna', N'Blade', N'inna2@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (9, N'Inna', N'Hogwarts', N'inna3@mail.ru', N'string')
INSERT [dbo].[Account] ([Id], [FirstName], [LastName], [Email], [Password]) VALUES (10, N'Razor', N'Hammer', N'razor2@mail.ru', N'string')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (1, -90, -180)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (2, 90, 180)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (3, -30, -60)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (4, 0, 1)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (5, 2, 3)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (6, 60, -60)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (7, 55, 55)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (8, 66, 66)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (9, 77, 77)
INSERT [dbo].[Location] ([Id], [Latitude], [Longitude]) VALUES (10, -11, 11)
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
SET IDENTITY_INSERT [dbo].[Animal] ON 

INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (1, 30, 60, 90, N'MALE', N'ALIVE', 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1, NULL)
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (2, 40, 70, 100, N'FEMALE', N'ALIVE', 1, CAST(N'2020-01-02T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (4, 45, 75, 105, N'FEMALE', N'ALIVE', 3, CAST(N'2018-02-02T00:00:00.000' AS DateTime), 3, NULL)
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (5, 25, 55, 85, N'MALE', N'ALIVE', 5, CAST(N'2010-02-02T00:00:00.000' AS DateTime), 6, NULL)
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (6, 30, 40, 50, N'OTHER', N'ALIVE', 6, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 9, NULL)
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (8, 5, 5, 5, N'OTHER', N'DEAD', 6, CAST(N'2010-02-02T00:00:00.000' AS DateTime), 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (10, 1, 1, 1, N'OTHER', N'DEAD', 7, CAST(N'2010-02-03T00:00:00.000' AS DateTime), 3, CAST(N'2020-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (13, 2, 2, 2, N'OTHER', N'DEAD', 8, CAST(N'2014-04-04T00:00:00.000' AS DateTime), 5, CAST(N'2018-08-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (14, 3, 3, 3, N'OTHER', N'ALIVE', 7, CAST(N'2018-09-09T00:00:00.000' AS DateTime), 2, NULL)
INSERT [dbo].[Animal] ([Id], [Weight], [Length], [Height], [Gender], [LifeStatus], [ChipperId], [ChippingDateTime], [ChippingLocationId], [DeathDateTime]) VALUES (17, 100, 150, 200, N'MALE', N'DEAD', 3, CAST(N'2000-01-01T00:00:00.000' AS DateTime), 2, CAST(N'2022-02-02T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Animal] OFF
GO
SET IDENTITY_INSERT [dbo].[VisitedLocation] ON 

INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (1, 1, 1, CAST(N'2023-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (2, 2, 1, CAST(N'2023-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (3, 3, 1, CAST(N'2023-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (4, 2, 2, CAST(N'2020-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (5, 4, 2, CAST(N'2020-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (6, 3, 4, CAST(N'2018-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (7, 5, 4, CAST(N'2018-04-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (8, 6, 5, CAST(N'2010-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (9, 7, 5, CAST(N'2011-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (10, 8, 5, CAST(N'2012-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (11, 9, 6, CAST(N'2022-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (12, 10, 6, CAST(N'2022-02-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (13, 1, 6, CAST(N'2022-02-05T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (14, 2, 8, CAST(N'2010-02-02T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (16, 4, 8, CAST(N'2010-02-07T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (19, 3, 10, CAST(N'2010-02-03T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (20, 5, 10, CAST(N'2012-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (21, 7, 10, CAST(N'2015-02-13T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (22, 5, 13, CAST(N'2014-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (23, 2, 13, CAST(N'2015-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (24, 10, 13, CAST(N'2020-04-04T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (26, 2, 14, CAST(N'2018-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (27, 7, 14, CAST(N'2019-09-09T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (28, 9, 14, CAST(N'2020-02-20T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (29, 2, 17, CAST(N'2000-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (30, 5, 17, CAST(N'2010-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[VisitedLocation] ([Id], [LocationId], [AnimalId], [VisitDateTime]) VALUES (31, 8, 17, CAST(N'2020-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[VisitedLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([Id], [Name]) VALUES (1, N'Bird')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (2, N'Fish')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (3, N'Insect')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (4, N'Amphibian')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (5, N'Mammal')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (6, N'Reptile')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (7, N'Cat')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (8, N'Tiger')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (9, N'Snake')
INSERT [dbo].[Type] ([Id], [Name]) VALUES (10, N'Worm')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (1, 1)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (1, 2)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (1, 3)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (2, 3)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (2, 4)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (4, 5)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (5, 1)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (5, 2)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (6, 8)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (6, 10)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (8, 7)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (10, 5)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (10, 6)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (13, 7)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (13, 8)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (14, 9)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (17, 6)
INSERT [dbo].[AnimalType] ([AnimalId], [TypeId]) VALUES (17, 7)
GO
