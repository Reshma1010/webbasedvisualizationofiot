using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class SensorDevice
    {
        public SensorDevice()
        {
            Sensors = new HashSet<Sensor>();
        }

        public long IdSensorDevice { get; set; }
        public string SensorDeviceId { get; set; } = null!;
        public string? Remark { get; set; }

        public virtual ICollection<Sensor> Sensors { get; set; }
    }
}
