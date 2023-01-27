ALTER PROCEDURE [dbo].[GET_ALL_SENSOR]
AS
BEGIN

SELECT 
	s.[idSensor] AS Id,
	s.[sensorSerialNumber] AS SerialNumber,
	s.[sensorDesignation] AS Designation,
	s.[active],
	s.[remark],
	sd.[sensorDeviceID] AS SensorDevice,
	s.[FloorNo],
	s.[RoomNo],
	s.[Xheight],
	s.[Ywidth]
FROM [Middleware].[dbo].[Sensor] s
  INNER JOIN SensorDevice sd on s.FK_idSensorDevice = sd.idSensorDevice;
	
END