USE [Middleware]
GO

/****** Object:  Table [dbo].[Sensor]    Script Date: 10/12/2022 12:21:12 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER TABLE [dbo].[Sensor] ADD [FloorNo] int NULL;
ALTER TABLE [dbo].[Sensor] ADD [RoomNo] int NULL;