ALTER PROCEDURE [dbo].[GET_SENSOR_DATA]
@FROM NVARCHAR(250) = null,
@TO NVARCHAR(250) = null,
@SENSOR_ID INT
AS
BEGIN

SET @FROM = CASE 
								WHEN (@FROM IS NULL) THEN (SELECT TOP 1 CAST(timeStamp AS DATE) FROM SensorData ORDER BY idSensorData DESC)
								ELSE @FROM END;
								
SET @TO = CASE
							WHEN (@TO IS NULL) THEN (SELECT TOP 1 CAST(timeStamp AS DATE) FROM SensorData ORDER BY idSensorData DESC)
							ELSE @TO END;

SELECT 
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
	WHERE (CAST(sd.[timeStamp] AS DATE) BETWEEN @FROM AND @TO) AND sd.FK_idSensor = @SENSOR_ID
ORDER BY sd.[idSensorData] DESC

END
