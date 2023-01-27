USE [Middleware]
GO
/****** Object:  Table [dbo].[RoomInfo]    Script Date: 10/27/2022 10:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInfo](
	[Room_Id] [int] IDENTITY(1,1) NOT NULL,
	[Floor_Number] [int] NOT NULL,
	[Rooom_Name] [int] NOT NULL,
	[Sensor_Capacity] [int] NOT NULL,
	[IsAbove] [bit] NOT NULL,
	[Left_TopX] [int] NOT NULL,
	[Left_TopY] [int] NOT NULL,
	[Right_TopX] [int] NOT NULL,
	[Right_TopY] [int] NOT NULL,
	[Left_BottomX] [int] NOT NULL,
	[Left_BottomY] [int] NOT NULL,
	[Right_BottomX] [int] NOT NULL,
	[Right_BottomY] [int] NOT NULL,
 CONSTRAINT [PK_RoomInfo] PRIMARY KEY CLUSTERED 
(
	[Room_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RoomInfo] ON 
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (1, 2, 201, 4, 1, 105, 30, 187, 30, 78, 120, 162, 143)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (3, 2, 203, 4, 1, 110, 55, 187, 30, 78, 120, 162, 143)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (4, 2, 205, 4, 1, 115, 75, 187, 30, 78, 120, 162, 143)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (5, 2, 207, 8, 1, 120, 110, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (6, 2, 211, 8, 1, 235, 155, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (7, 2, 212, 8, 1, 345, 185, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (26, 2, 202, 4, 0, -670, 260, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (27, 2, 204, 4, 0, -665, 280, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (28, 2, 206, 4, 0, -660, 300, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (29, 2, 208, 4, 0, -655, 325, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (30, 2, 209, 4, 0, -650, 340, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (31, 2, 213, 8, 0, -240, 410, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (32, 3, 301, 4, 1, 105, 30, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (33, 3, 303, 4, 1, 110, 55, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (34, 3, 304, 4, 1, 115, 75, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (35, 3, 306, 8, 1, 120, 110, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (36, 3, 310, 8, 1, 280, 165, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (37, 3, 311, 4, 1, 340, 178, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (38, 3, 312, 8, 1, 360, 195, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (39, 3, 302, 8, 0, -740, 265, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (40, 3, 305, 8, 0, -730, 310, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (41, 3, 307, 4, 0, -715, 330, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (42, 3, 308, 4, 0, -715, 360, 30, 30, 30, 30, 30, 30)
GO
INSERT [dbo].[RoomInfo] ([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (43, 3, 313, 8, 0, -360, 410, 30, 30, 30, 30, 30, 30)
GO
SET IDENTITY_INSERT [dbo].[RoomInfo] OFF
GO
