USE [master]
GO
/****** Object:  Database [Middleware]    Script Date: 9/30/2022 8:50:00 PM ******/
CREATE DATABASE [Middleware]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Middleware_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Middleware.mdf' , SIZE = 1999872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Middleware_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Middleware.ldf' , SIZE = 56064KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Middleware] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Middleware].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Middleware] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Middleware] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Middleware] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Middleware] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Middleware] SET ARITHABORT OFF 
GO
ALTER DATABASE [Middleware] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Middleware] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Middleware] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Middleware] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Middleware] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Middleware] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Middleware] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Middleware] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Middleware] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Middleware] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Middleware] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Middleware] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Middleware] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Middleware] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Middleware] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Middleware] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Middleware] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Middleware] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Middleware] SET  MULTI_USER 
GO
ALTER DATABASE [Middleware] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Middleware] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Middleware] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Middleware] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Middleware] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Middleware] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Middleware', N'ON'
GO
ALTER DATABASE [Middleware] SET QUERY_STORE = OFF
GO
USE [Middleware]
GO
/****** Object:  User [IIS APPPOOL\IoT-WebApp]    Script Date: 9/30/2022 8:50:00 PM ******/
CREATE USER [IIS APPPOOL\IoT-WebApp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [DESKTOP-TTB0FRE\Administrator]    Script Date: 9/30/2022 8:50:00 PM ******/
CREATE USER [DESKTOP-TTB0FRE\Administrator] FOR LOGIN [DESKTOP-TTB0FRE\Administrator] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\IoT-WebApp]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\IoT-WebApp]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\IoT-WebApp]
GO
ALTER ROLE [db_owner] ADD MEMBER [DESKTOP-TTB0FRE\Administrator]
GO
/****** Object:  Table [dbo].[BeaconSensor]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BeaconSensor](
	[Id] [int] NOT NULL,
	[FloorNo] [int] NOT NULL,
	[Xaxis] [int] NOT NULL,
	[Yaxis] [int] NOT NULL,
	[SensorId] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_BeaconSensor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataType]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataType](
	[idDataType] [bigint] IDENTITY(1,1) NOT NULL,
	[dataTypeDesignation] [varchar](50) NULL,
	[remark] [varchar](max) NULL,
 CONSTRAINT [PK_DataType] PRIMARY KEY CLUSTERED 
(
	[idDataType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Door_Info]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Door_Info](
	[idx] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [text] NULL,
	[IP_Address] [nvarchar](50) NULL,
	[Port] [int] NULL,
	[Channel] [tinyint] NULL,
	[Channel_Sensor_Opened] [tinyint] NULL,
	[Status_Coil] [bit] NULL,
	[Status_Sensor_Closed] [bit] NULL,
	[Status_Sensor_Opened] [bit] NULL,
 CONSTRAINT [PK_Door_Info] PRIMARY KEY CLUSTERED 
(
	[idx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[idLocation] [bigint] IDENTITY(1,1) NOT NULL,
	[countOfDetectedBeacons] [tinyint] NULL,
	[Beacon1_ID] [int] NULL,
	[Beacon1_RoomNum] [int] NULL,
	[Beacon1_RSSIMean] [smallint] NULL,
	[Beacon1_TXPower] [smallint] NULL,
	[Beacon2_ID] [int] NULL,
	[Beacon2_RoomNum] [int] NULL,
	[Beacon2_RSSIMean] [smallint] NULL,
	[Beacon2_TXPower] [smallint] NULL,
	[Beacon3_ID] [int] NULL,
	[Beacon3_RoomNum] [int] NULL,
	[Beacon3_RSSIMean] [smallint] NULL,
	[Beacon3_TXPower] [smallint] NULL,
	[Beacon4_ID] [int] NULL,
	[Beacon4_RoomNum] [int] NULL,
	[Beacon4_RSSIMean] [smallint] NULL,
	[Beacon4_TXPower] [smallint] NULL,
	[Beacon5_ID] [int] NULL,
	[Beacon5_RoomNum] [int] NULL,
	[Beacon5_RSSIMean] [smallint] NULL,
	[Beacon5_TXPower] [smallint] NULL,
	[Beacon6_ID] [int] NULL,
	[Beacon6_RoomNum] [int] NULL,
	[Beacon6_RSSIMean] [smallint] NULL,
	[Beacon6_TXPower] [smallint] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[idLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileRobot]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileRobot](
	[Id] [int] NOT NULL,
	[FloorNo] [int] NOT NULL,
	[Xaxis] [int] NOT NULL,
	[Yaxis] [int] NOT NULL,
	[SensorId] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_MobileRebort] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileSensor]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileSensor](
	[Id] [int] NOT NULL,
	[FloorNo] [int] NOT NULL,
	[Xaxis] [int] NOT NULL,
	[Yaxis] [int] NOT NULL,
	[SensorId] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_MobileSensor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sensor]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sensor](
	[idSensor] [bigint] IDENTITY(1,1) NOT NULL,
	[sensorSerialNumber] [varchar](max) NULL,
	[sensorDesignation] [varchar](50) NULL,
	[active] [bit] NULL,
	[remark] [varchar](max) NULL,
	[FK_idSensorDevice] [bigint] NULL,
 CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED 
(
	[idSensor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SensorData]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensorData](
	[idSensorData] [bigint] IDENTITY(1,1) NOT NULL,
	[timeStamp] [datetime] NULL,
	[value] [float] NULL,
	[FK_idUnit] [bigint] NULL,
	[FK_idDataType] [bigint] NULL,
	[FK_idSensor] [bigint] NULL,
	[FK_idLocation] [bigint] NULL,
 CONSTRAINT [PK_SensorData] PRIMARY KEY CLUSTERED 
(
	[idSensorData] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SensorDevice]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SensorDevice](
	[idSensorDevice] [bigint] IDENTITY(1,1) NOT NULL,
	[sensorDeviceID] [varchar](50) NOT NULL,
	[remark] [varchar](max) NULL,
 CONSTRAINT [PK_SensorDevice] PRIMARY KEY CLUSTERED 
(
	[idSensorDevice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StationarySensor]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StationarySensor](
	[Id] [int] NOT NULL,
	[FloorNo] [int] NOT NULL,
	[Xaxis] [int] NOT NULL,
	[Yaxis] [int] NOT NULL,
	[SensorId] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_StationarySensor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[idUnit] [bigint] IDENTITY(1,1) NOT NULL,
	[abbreviation] [varchar](50) NULL,
	[designation] [varchar](50) NULL,
	[description] [varchar](50) NULL,
	[translate] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[idUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location]    Script Date: 9/30/2022 8:50:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Location] ON [dbo].[Location]
(
	[idLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sensor]    Script Date: 9/30/2022 8:50:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Sensor] ON [dbo].[Sensor]
(
	[idSensor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SensorDevice]    Script Date: 9/30/2022 8:50:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_SensorDevice] ON [dbo].[SensorDevice]
(
	[idSensorDevice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Unit]    Script Date: 9/30/2022 8:50:01 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Unit] ON [dbo].[Unit]
(
	[idUnit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Sensor]  WITH CHECK ADD  CONSTRAINT [FK_Sensor_SensorDevice] FOREIGN KEY([FK_idSensorDevice])
REFERENCES [dbo].[SensorDevice] ([idSensorDevice])
GO
ALTER TABLE [dbo].[Sensor] CHECK CONSTRAINT [FK_Sensor_SensorDevice]
GO
ALTER TABLE [dbo].[SensorData]  WITH CHECK ADD  CONSTRAINT [FK_SensorData_DataType] FOREIGN KEY([FK_idDataType])
REFERENCES [dbo].[DataType] ([idDataType])
GO
ALTER TABLE [dbo].[SensorData] CHECK CONSTRAINT [FK_SensorData_DataType]
GO
ALTER TABLE [dbo].[SensorData]  WITH CHECK ADD  CONSTRAINT [FK_SensorData_Location] FOREIGN KEY([FK_idLocation])
REFERENCES [dbo].[Location] ([idLocation])
GO
ALTER TABLE [dbo].[SensorData] CHECK CONSTRAINT [FK_SensorData_Location]
GO
ALTER TABLE [dbo].[SensorData]  WITH CHECK ADD  CONSTRAINT [FK_SensorData_Sensor] FOREIGN KEY([FK_idSensor])
REFERENCES [dbo].[Sensor] ([idSensor])
GO
ALTER TABLE [dbo].[SensorData] CHECK CONSTRAINT [FK_SensorData_Sensor]
GO
ALTER TABLE [dbo].[SensorData]  WITH CHECK ADD  CONSTRAINT [FK_SensorData_Unit] FOREIGN KEY([FK_idUnit])
REFERENCES [dbo].[Unit] ([idUnit])
GO
ALTER TABLE [dbo].[SensorData] CHECK CONSTRAINT [FK_SensorData_Unit]
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Receiver') DROP SERVICE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender') DROP SERVICE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Receiver') DROP QUEUE [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender') DROP QUEUE [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7') DROP CONTRACT [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/idDataType') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/remark') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/EndMessage') DROP MESSAGE TYPE [dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_0dfd26db-5968-4b22-9b97-ad37e8f3fca7_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Receiver') DROP SERVICE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender') DROP SERVICE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Receiver') DROP QUEUE [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender') DROP QUEUE [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11') DROP CONTRACT [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/idDataType') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/remark') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/EndMessage') DROP MESSAGE TYPE [dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_0f277fd9-8bd5-45da-aec7-5fd8ce53cf11_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Receiver') DROP SERVICE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender') DROP SERVICE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Receiver') DROP QUEUE [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender') DROP QUEUE [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f') DROP CONTRACT [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/idDataType') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/remark') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/EndMessage') DROP MESSAGE TYPE [dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_1519418b-5099-4e73-b706-8619058b9a9f_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Receiver') DROP SERVICE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender') DROP SERVICE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Receiver') DROP QUEUE [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender') DROP QUEUE [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416') DROP CONTRACT [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/idDataType') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/remark') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/EndMessage') DROP MESSAGE TYPE [dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_2079146b-9ef7-4e8d-92ac-c4f0a3ccc416_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Receiver') DROP SERVICE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender') DROP SERVICE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Receiver') DROP QUEUE [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender') DROP QUEUE [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c') DROP CONTRACT [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/idDataType') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/remark') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/EndMessage') DROP MESSAGE TYPE [dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_2286605b-7613-4a48-8fb8-efd36ef1a71c_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Receiver') DROP SERVICE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender') DROP SERVICE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Receiver') DROP QUEUE [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender') DROP QUEUE [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42') DROP CONTRACT [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/idDataType') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/remark') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/EndMessage') DROP MESSAGE TYPE [dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_26f5726b-ef7e-4d78-b55d-2b3f9d0dce42_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Receiver') DROP SERVICE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender') DROP SERVICE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Receiver') DROP QUEUE [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender') DROP QUEUE [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3') DROP CONTRACT [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/idDataType') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/remark') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/EndMessage') DROP MESSAGE TYPE [dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_27c8c816-e40f-4125-b37a-ca2d10add7c3_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Receiver') DROP SERVICE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender') DROP SERVICE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Receiver') DROP QUEUE [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender') DROP QUEUE [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565') DROP CONTRACT [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/idDataType') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/remark') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/EndMessage') DROP MESSAGE TYPE [dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_4d9eeb55-286a-498f-ac6c-9133ebd0c565_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Receiver') DROP SERVICE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender') DROP SERVICE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Receiver') DROP QUEUE [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender') DROP QUEUE [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2') DROP CONTRACT [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/idDataType') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/remark') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/EndMessage') DROP MESSAGE TYPE [dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_5e783cec-7936-4fdb-9d94-ca37960a9dd2_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Receiver') DROP SERVICE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender') DROP SERVICE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Receiver') DROP QUEUE [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender') DROP QUEUE [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0') DROP CONTRACT [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/idDataType') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/remark') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/EndMessage') DROP MESSAGE TYPE [dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_77f0dd12-0a47-431a-9371-8999985085a0_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Receiver') DROP SERVICE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender') DROP SERVICE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Receiver') DROP QUEUE [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender') DROP QUEUE [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03') DROP CONTRACT [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/idDataType') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/remark') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/EndMessage') DROP MESSAGE TYPE [dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_796ce071-451e-4019-98e5-52dbd9020d03_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Receiver') DROP SERVICE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender') DROP SERVICE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Receiver') DROP QUEUE [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender') DROP QUEUE [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7') DROP CONTRACT [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/idDataType') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/remark') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/EndMessage') DROP MESSAGE TYPE [dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_7e8dc4ff-49d9-4ee4-95c9-b0c355b54ad7_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Receiver') DROP SERVICE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender') DROP SERVICE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Receiver') DROP QUEUE [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender') DROP QUEUE [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08') DROP CONTRACT [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/idDataType') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/remark') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/EndMessage') DROP MESSAGE TYPE [dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_89ac805b-7070-4dd8-85ba-ac7772da0c08_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Receiver') DROP SERVICE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender') DROP SERVICE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Receiver') DROP QUEUE [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender') DROP QUEUE [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624') DROP CONTRACT [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/idDataType') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/remark') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/EndMessage') DROP MESSAGE TYPE [dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_bfd8c842-5878-41b7-880d-c48d2f139624_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Receiver') DROP SERVICE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender') DROP SERVICE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Receiver') DROP QUEUE [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender') DROP QUEUE [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3') DROP CONTRACT [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/idDataType') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/remark') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/EndMessage') DROP MESSAGE TYPE [dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_cfe3d903-b10f-4fe3-8ae6-f2c7e70bf4e3_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Receiver') DROP SERVICE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender') DROP SERVICE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Receiver') DROP QUEUE [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender') DROP QUEUE [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc') DROP CONTRACT [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/idDataType') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/remark') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/EndMessage') DROP MESSAGE TYPE [dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_de1c1010-04e2-48de-8eee-f28c61390ddc_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender]')) DROP TRIGGER [dbo].[tr_dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Receiver') DROP SERVICE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender') DROP SERVICE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Receiver') DROP QUEUE [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender') DROP QUEUE [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c') DROP CONTRACT [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/StartMessage/Insert') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/StartMessage/Update') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/StartMessage/Delete') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/idDataType') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/idDataType];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/dataTypeDesignation') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/dataTypeDesignation];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/remark') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/remark];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/EndMessage') DROP MESSAGE TYPE [dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_DataType_fde554e7-b7c6-4476-ae1d-4c398f28b24c_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Receiver') DROP SERVICE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender') DROP SERVICE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Receiver') DROP QUEUE [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender') DROP QUEUE [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71') DROP CONTRACT [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/value') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_0cc574b3-8f77-4795-accc-4c2319eded71_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Receiver') DROP SERVICE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender') DROP SERVICE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Receiver') DROP QUEUE [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender') DROP QUEUE [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7') DROP CONTRACT [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/value') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_137efd55-62a8-44b4-aa68-b2b38a9f8db7_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Receiver') DROP SERVICE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender') DROP SERVICE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Receiver') DROP QUEUE [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender') DROP QUEUE [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f') DROP CONTRACT [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/value') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_1e61720e-ae41-4e1f-bd38-639c58a5f77f_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Receiver') DROP SERVICE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender') DROP SERVICE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Receiver') DROP QUEUE [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender') DROP QUEUE [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0') DROP CONTRACT [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/value') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_1ff18880-2e37-4ba8-9931-e7776c1504d0_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Receiver') DROP SERVICE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender') DROP SERVICE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Receiver') DROP QUEUE [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender') DROP QUEUE [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed') DROP CONTRACT [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/value') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_40b2fd6d-a0b0-420b-a95d-6b60d13ec7ed_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Receiver') DROP SERVICE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender') DROP SERVICE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Receiver') DROP QUEUE [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender') DROP QUEUE [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc') DROP CONTRACT [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/value') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_431632ab-4b5d-4392-9835-ff3d1ecc3ddc_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Receiver') DROP SERVICE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender') DROP SERVICE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Receiver') DROP QUEUE [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender') DROP QUEUE [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca') DROP CONTRACT [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/value') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_4934995b-36ab-44cc-9658-491475fff2ca_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Receiver') DROP SERVICE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender') DROP SERVICE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Receiver') DROP QUEUE [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender') DROP QUEUE [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc') DROP CONTRACT [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/value') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_59087dc8-ffc2-44aa-8c04-9d4dce648ddc_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Receiver') DROP SERVICE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender') DROP SERVICE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Receiver') DROP QUEUE [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender') DROP QUEUE [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552') DROP CONTRACT [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/value') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_5bb8061d-52c0-442e-81fb-dfa02ba54552_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Receiver') DROP SERVICE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender') DROP SERVICE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Receiver') DROP QUEUE [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender') DROP QUEUE [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723') DROP CONTRACT [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/value') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_6047982e-65c8-4895-9aaa-85ead257a723_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Receiver') DROP SERVICE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender') DROP SERVICE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Receiver') DROP QUEUE [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender') DROP QUEUE [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e') DROP CONTRACT [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/value') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_69d47894-5a16-4db7-a4f7-59d7a9ab8c3e_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Receiver') DROP SERVICE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender') DROP SERVICE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Receiver') DROP QUEUE [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender') DROP QUEUE [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e') DROP CONTRACT [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/value') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_8a2a3294-6672-4098-a474-9999d0811e6e_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Receiver') DROP SERVICE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender') DROP SERVICE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Receiver') DROP QUEUE [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender') DROP QUEUE [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc') DROP CONTRACT [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/value') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_957baff2-de2c-4fcd-992b-6e5eda3176fc_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Receiver') DROP SERVICE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender') DROP SERVICE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Receiver') DROP QUEUE [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender') DROP QUEUE [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f') DROP CONTRACT [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/value') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_a7eb0f5e-9cba-4f37-9e89-c7ec5e13152f_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Receiver') DROP SERVICE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender') DROP SERVICE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Receiver') DROP QUEUE [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender') DROP QUEUE [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88') DROP CONTRACT [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/value') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_c983ce6e-e8ed-41f9-8ac2-1adf801b3a88_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Receiver') DROP SERVICE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender') DROP SERVICE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Receiver') DROP QUEUE [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender') DROP QUEUE [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a') DROP CONTRACT [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/value') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_e2bba442-65f0-4bd4-88c9-f4a87ce4ef5a_QueueActivationSender];

        
    END
END
GO
/****** Object:  StoredProcedure [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_QueueActivationSender]    Script Date: 9/30/2022 8:50:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender]')) DROP TRIGGER [dbo].[tr_dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Receiver') DROP SERVICE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender') DROP SERVICE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Receiver') DROP QUEUE [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender') DROP QUEUE [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152') DROP CONTRACT [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/StartMessage/Insert') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/StartMessage/Update') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/StartMessage/Delete') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/idSensorData') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/idSensorData];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/timeStamp') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/timeStamp];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/value') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/value];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/EndMessage') DROP MESSAGE TYPE [dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_SensorData_e5f69e67-9fe3-49e6-ad09-ed036f38b152_QueueActivationSender];

        
    END
END
GO
USE [master]
GO
ALTER DATABASE [Middleware] SET  READ_WRITE 
GO
