using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class Sensor
    {
        public Sensor()
        {
            SensorData = new HashSet<SensorDatum>();
        }

        public long IdSensor { get; set; }
        public string? SensorSerialNumber { get; set; }
        public string? SensorDesignation { get; set; }
        public bool? Active { get; set; }
        public string? Remark { get; set; }
        public long? FkIdSensorDevice { get; set; }

        public int? FloorNo { get; set; }
        public int? RoomNo { get; set; }
        public int? Xheight { get; set; }
        public int? YWidth { get; set; }

        public virtual SensorDevice? FkIdSensorDeviceNavigation { get; set; }
        public virtual ICollection<SensorDatum> SensorData { get; set; }
    }
}
