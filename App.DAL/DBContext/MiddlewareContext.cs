using System;
using System.Collections.Generic;
using App.DAL.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace App.DAL.DBContext
{
    public partial class MiddlewareContext : DbContext
    {
        public MiddlewareContext()
        {
        }

        public MiddlewareContext(DbContextOptions<MiddlewareContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BeaconSensor> BeaconSensors { get; set; } = null!;
        public virtual DbSet<DataType> DataTypes { get; set; } = null!;
        public virtual DbSet<DoorInfo> DoorInfos { get; set; } = null!;
        public virtual DbSet<Location> Locations { get; set; } = null!;
        public virtual DbSet<MobileRobot> MobileRobots { get; set; } = null!;
        public virtual DbSet<MobileSensor> MobileSensors { get; set; } = null!;
        public virtual DbSet<RoomInfo> RoomInfos { get; set; } = null!;
        public virtual DbSet<Sensor> Sensors { get; set; } = null!;
        public virtual DbSet<SensorDatum> SensorData { get; set; } = null!;
        public virtual DbSet<SensorDevice> SensorDevices { get; set; } = null!;
        public virtual DbSet<StationarySensor> StationarySensors { get; set; } = null!;
        public virtual DbSet<Unit> Units { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=localhost;Database=Middleware;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseCollation("Latin1_General_CI_AS");

            modelBuilder.Entity<BeaconSensor>(entity =>
            {
                entity.ToTable("BeaconSensor");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SensorId).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.FloorNo);
                entity.Property(e => e.Xaxis);
                entity.Property(e => e.Yaxis);
                entity.Property(e => e.Xheight);
                entity.Property(e => e.Ywidth);

                entity.Property(e => e.Description).HasMaxLength(255);
            });

            modelBuilder.Entity<DataType>(entity =>
            {
                entity.HasKey(e => e.IdDataType);

                entity.ToTable("DataType");

                entity.Property(e => e.IdDataType).HasColumnName("idDataType");

                entity.Property(e => e.DataTypeDesignation)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("dataTypeDesignation");

                entity.Property(e => e.Remark)
                    .IsUnicode(false)
                    .HasColumnName("remark");
            });

            modelBuilder.Entity<DoorInfo>(entity =>
            {
                entity.HasKey(e => e.Idx);

                entity.ToTable("Door_Info");

                entity.Property(e => e.Idx).HasColumnName("idx");

                entity.Property(e => e.ChannelSensorOpened).HasColumnName("Channel_Sensor_Opened");

                entity.Property(e => e.Description).HasColumnType("text");

                entity.Property(e => e.IpAddress)
                    .HasMaxLength(50)
                    .HasColumnName("IP_Address");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.StatusCoil).HasColumnName("Status_Coil");

                entity.Property(e => e.StatusSensorClosed).HasColumnName("Status_Sensor_Closed");

                entity.Property(e => e.StatusSensorOpened).HasColumnName("Status_Sensor_Opened");
            });

            modelBuilder.Entity<Location>(entity =>
            {
                entity.HasKey(e => e.IdLocation);

                entity.ToTable("Location");

                entity.HasIndex(e => e.IdLocation, "IX_Location")
                    .IsUnique();

                entity.Property(e => e.IdLocation).HasColumnName("idLocation");

                entity.Property(e => e.Beacon1Id).HasColumnName("Beacon1_ID");

                entity.Property(e => e.Beacon1RoomNum).HasColumnName("Beacon1_RoomNum");

                entity.Property(e => e.Beacon1Rssimean).HasColumnName("Beacon1_RSSIMean");

                entity.Property(e => e.Beacon1Txpower).HasColumnName("Beacon1_TXPower");

                entity.Property(e => e.Beacon2Id).HasColumnName("Beacon2_ID");

                entity.Property(e => e.Beacon2RoomNum).HasColumnName("Beacon2_RoomNum");

                entity.Property(e => e.Beacon2Rssimean).HasColumnName("Beacon2_RSSIMean");

                entity.Property(e => e.Beacon2Txpower).HasColumnName("Beacon2_TXPower");

                entity.Property(e => e.Beacon3Id).HasColumnName("Beacon3_ID");

                entity.Property(e => e.Beacon3RoomNum).HasColumnName("Beacon3_RoomNum");

                entity.Property(e => e.Beacon3Rssimean).HasColumnName("Beacon3_RSSIMean");

                entity.Property(e => e.Beacon3Txpower).HasColumnName("Beacon3_TXPower");

                entity.Property(e => e.Beacon4Id).HasColumnName("Beacon4_ID");

                entity.Property(e => e.Beacon4RoomNum).HasColumnName("Beacon4_RoomNum");

                entity.Property(e => e.Beacon4Rssimean).HasColumnName("Beacon4_RSSIMean");

                entity.Property(e => e.Beacon4Txpower).HasColumnName("Beacon4_TXPower");

                entity.Property(e => e.Beacon5Id).HasColumnName("Beacon5_ID");

                entity.Property(e => e.Beacon5RoomNum).HasColumnName("Beacon5_RoomNum");

                entity.Property(e => e.Beacon5Rssimean).HasColumnName("Beacon5_RSSIMean");

                entity.Property(e => e.Beacon5Txpower).HasColumnName("Beacon5_TXPower");

                entity.Property(e => e.Beacon6Id).HasColumnName("Beacon6_ID");

                entity.Property(e => e.Beacon6RoomNum).HasColumnName("Beacon6_RoomNum");

                entity.Property(e => e.Beacon6Rssimean).HasColumnName("Beacon6_RSSIMean");

                entity.Property(e => e.Beacon6Txpower).HasColumnName("Beacon6_TXPower");

                entity.Property(e => e.CountOfDetectedBeacons).HasColumnName("countOfDetectedBeacons");
            });

            modelBuilder.Entity<MobileRobot>(entity =>
            {
                entity.ToTable("MobileRobot");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SensorId).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);
            });

            modelBuilder.Entity<MobileSensor>(entity =>
            {
                entity.ToTable("MobileSensor");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SensorId).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);
            });

            modelBuilder.Entity<RoomInfo>(entity =>
            {
                entity.HasKey(e => e.RoomId);

                entity.ToTable("RoomInfo");

                entity.Property(e => e.RoomId).HasColumnName("Room_Id");

                entity.Property(e => e.FloorNumber).HasColumnName("Floor_Number");

                entity.Property(e => e.LeftBottomX).HasColumnName("Left_BottomX");

                entity.Property(e => e.LeftBottomY).HasColumnName("Left_BottomY");

                entity.Property(e => e.LeftTopX).HasColumnName("Left_TopX");

                entity.Property(e => e.LeftTopY).HasColumnName("Left_TopY");

                entity.Property(e => e.RightBottomX).HasColumnName("Right_BottomX");

                entity.Property(e => e.RightBottomY).HasColumnName("Right_BottomY");

                entity.Property(e => e.RightTopX).HasColumnName("Right_TopX");

                entity.Property(e => e.RightTopY).HasColumnName("Right_TopY");

                entity.Property(e => e.RooomName).HasColumnName("Rooom_Name");

                entity.Property(e => e.SensorCapacity).HasColumnName("Sensor_Capacity");
                entity.Property(e => e.IsAbove).HasColumnName("IsAbove");
            });

            modelBuilder.Entity<Sensor>(entity =>
            {
                entity.HasKey(e => e.IdSensor);

                entity.ToTable("Sensor");

                entity.HasIndex(e => e.IdSensor, "IX_Sensor")
                    .IsUnique();

                entity.Property(e => e.IdSensor).HasColumnName("idSensor");

                entity.Property(e => e.Active).HasColumnName("active");

                entity.Property(e => e.FkIdSensorDevice).HasColumnName("FK_idSensorDevice");

                entity.Property(e => e.FloorNo);
                entity.Property(e => e.RoomNo);
                entity.Property(e => e.Xheight);
                entity.Property(e => e.YWidth);

                entity.Property(e => e.Remark)
                    .IsUnicode(false)
                    .HasColumnName("remark");

                entity.Property(e => e.SensorDesignation)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("sensorDesignation");

                entity.Property(e => e.SensorSerialNumber)
                    .IsUnicode(false)
                    .HasColumnName("sensorSerialNumber");

                entity.HasOne(d => d.FkIdSensorDeviceNavigation)
                    .WithMany(p => p.Sensors)
                    .HasForeignKey(d => d.FkIdSensorDevice)
                    .HasConstraintName("FK_Sensor_SensorDevice");
            });

            modelBuilder.Entity<SensorDatum>(entity =>
            {
                entity.HasKey(e => e.IdSensorData);

                entity.Property(e => e.IdSensorData).HasColumnName("idSensorData");

                entity.Property(e => e.FkIdDataType).HasColumnName("FK_idDataType");

                entity.Property(e => e.FkIdLocation).HasColumnName("FK_idLocation");

                entity.Property(e => e.FkIdSensor).HasColumnName("FK_idSensor");

                entity.Property(e => e.FkIdUnit).HasColumnName("FK_idUnit");

                entity.Property(e => e.TimeStamp)
                    .HasColumnType("datetime")
                    .HasColumnName("timeStamp");

                entity.Property(e => e.Value).HasColumnName("value");

                entity.HasOne(d => d.FkIdDataTypeNavigation)
                    .WithMany(p => p.SensorData)
                    .HasForeignKey(d => d.FkIdDataType)
                    .HasConstraintName("FK_SensorData_DataType");

                entity.HasOne(d => d.FkIdLocationNavigation)
                    .WithMany(p => p.SensorData)
                    .HasForeignKey(d => d.FkIdLocation)
                    .HasConstraintName("FK_SensorData_Location");

                entity.HasOne(d => d.FkIdSensorNavigation)
                    .WithMany(p => p.SensorData)
                    .HasForeignKey(d => d.FkIdSensor)
                    .HasConstraintName("FK_SensorData_Sensor");

                entity.HasOne(d => d.FkIdUnitNavigation)
                    .WithMany(p => p.SensorData)
                    .HasForeignKey(d => d.FkIdUnit)
                    .HasConstraintName("FK_SensorData_Unit");
            });

            modelBuilder.Entity<SensorDevice>(entity =>
            {
                entity.HasKey(e => e.IdSensorDevice);

                entity.ToTable("SensorDevice");

                entity.HasIndex(e => e.IdSensorDevice, "IX_SensorDevice")
                    .IsUnique();

                entity.Property(e => e.IdSensorDevice).HasColumnName("idSensorDevice");

                entity.Property(e => e.Remark)
                    .IsUnicode(false)
                    .HasColumnName("remark");

                entity.Property(e => e.SensorDeviceId)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("sensorDeviceID");
            });

            modelBuilder.Entity<StationarySensor>(entity =>
            {
                entity.ToTable("StationarySensor");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.SensorId).HasMaxLength(50);

                entity.Property(e => e.Status).HasMaxLength(50);
            });

            modelBuilder.Entity<Unit>(entity =>
            {
                entity.HasKey(e => e.IdUnit);

                entity.ToTable("Unit");

                entity.HasIndex(e => e.IdUnit, "IX_Unit")
                    .IsUnique();

                entity.Property(e => e.IdUnit).HasColumnName("idUnit");

                entity.Property(e => e.Abbreviation)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("abbreviation");

                entity.Property(e => e.Description)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("description");

                entity.Property(e => e.Designation)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("designation");

                entity.Property(e => e.Translate)
                    .HasMaxLength(50)
                    .HasColumnName("translate");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
