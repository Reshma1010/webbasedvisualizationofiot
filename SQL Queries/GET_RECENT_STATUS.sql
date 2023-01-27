ALTER PROCEDURE [dbo].[GET_RECENT_STATUS](
@SENSOR_ID INT,
@NUM INT
)
AS
BEGIN

SELECT TOP(@NUM) 
	sd.[idSensorData] AS Record_Id,
	sd.[FK_idSensor] As Sensor_Id,
	sd.[timeStamp] AS Sensor_Date,
	sd.[value] AS Value,
	u.[abbreviation] AS Unit,
	d.[dataTypeDesignation] AS Data_Type,
	s.[sensorDesignation] AS Sensor_Name,
	sd.[FK_idLocation] AS Location
FROM [Middleware].[dbo].[SensorData] sd
INNER JOIN Unit u on sd.FK_idUnit=u.idUnit
INNER JOIN DataType d on sd.FK_idDataType=d.idDataType
INNER JOIN Sensor s on sd.FK_idSensor=s.idSensor
	WHERE sd.[FK_idSensor] = @SENSOR_ID
ORDER BY sd.[timeStamp] DESC
	
END