ALTER TABLE [dbo].[Sensor] ADD [Xheight] int NULL;
ALTER TABLE [dbo].[Sensor] ADD [Ywidth] int NULL;

ALTER TABLE [dbo].[BeaconSensor] ADD [Xheight] int NULL;
ALTER TABLE [dbo].[BeaconSensor] ADD [Ywidth] int NULL;
ALTER TABLE [dbo].[BeaconSensor] ADD [Description] nvarchar(255) NULL;


TRUNCATE TABLE [dbo].[BeaconSensor]; 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (1, 2, 535, 300, N'7', N'Active', 250, 69, N'209 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (2, 2, 562, 304, N'8', N'Active', 168, 43, N'inside 209'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (3, 2, 616, 269, N'9', N'Active', 217, 57, N'left entrance door 2ndflr'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (4, 2, 677, 278, N'10', N'Active', 217, 56, N'beside staircse right main door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (5, 2, 690, 237, N'11', N'Active', 217, 61, N'211 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (6, 2, 658, 203, N'12', N'Active', 168, 290, N'211 inside room'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (7, 2, 932, 306, N'14', N'Active', 168, 5, N'213 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (8, 2, 1055, 295, N'15', N'Active', 217, 54, N'212 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (9, 2, 895, 237, N'16', N'Active', 171, 84, N'212 inside room'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (10, 2, 644, 287, N'NOID', N'Active', 219, 38, N'beacon top of elevator-flr2'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (11, 3, 629, 278, N'NOID', N'Active', 219, 40, N'beacon top of elevator-flr3'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (12, 3, 390, 183, N'17', N'Active', 217, 58, N'306 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (13, 3, 359, 144, N'NOID', N'Active', 169, 119, N'306 inside'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (14, 3, 597, 257, N'20', N'Active', 217, 58, N'left mainentrance flr3 top'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (15, 3, 665, 267, N'21', N'Active', 217, 58, N'right mainentace'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (16, 3, 810, 264, N'22', N'Active', 217, 60, N'310 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (17, 3, 777, 227, N'23', N'Active', 169, 19, N'310 inside'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (18, 3, 971, 319, N'24', N'Active', 217, 56, N'313 on door'); 
INSERT INTO [BeaconSensor]([Id], [FloorNo], [Xaxis], [Yaxis], [SensorId], [Status], [Xheight], [Ywidth], [Description]) VALUES (19, 3, 1095, 364, N'25', N'Active', 215, 66, N'inside 313'); 


TRUNCATE TABLE [dbo].[RoomInfo];
SET IDENTITY_INSERT [dbo].[RoomInfo] ON 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (1, 2, 201, 4, '1', 105, 35, 187, 30, 78, 120, 162, 143); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (3, 2, 203, 4, '1', 40, 55, 187, 30, 78, 120, 162, 143); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (4, 2, 205, 4, '1', -30, 75, 187, 30, 78, 120, 162, 143); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (5, 2, 207, 8, '1', -95, 110, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (6, 2, 211, 8, '1', -95, 160, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (7, 2, 212, 8, '1', -20, 190, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (26, 2, 202, 4, '0', -25, 265, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (27, 2, 204, 4, '0', -100, 290, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (28, 2, 206, 4, '0', -165, 310, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (29, 2, 208, 4, '0', -305, 335, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (30, 2, 209, 4, '0', -190, 375, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (31, 2, 213, 8, '0', -180, 430, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (32, 3, 301, 4, '1', 110, 35, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (33, 3, 303, 4, '1', -35, 55, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (34, 3, 304, 4, '1', -25, 75, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (35, 3, 306, 8, '1', -165, 110, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (36, 3, 310, 8, '1', -180, 170, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (37, 3, 311, 4, '1', -110, 195, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (38, 3, 312, 8, '1', -95, 215, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (39, 3, 302, 8, '0', -30, 265, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (40, 3, 305, 8, '0', -150, 315, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (41, 3, 307, 4, '0', -285, 350, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (42, 3, 308, 4, '0', -275, 365, 30, 30, 30, 30, 30, 30); 
INSERT INTO [RoomInfo]([Room_Id], [Floor_Number], [Rooom_Name], [Sensor_Capacity], [IsAbove], [Left_TopX], [Left_TopY], [Right_TopX], [Right_TopY], [Left_BottomX], [Left_BottomY], [Right_BottomX], [Right_BottomY]) VALUES (43, 3, 313, 8, '0', -300, 430, 30, 30, 30, 30, 30, 30); 

SET IDENTITY_INSERT [dbo].[RoomInfo] OFF

