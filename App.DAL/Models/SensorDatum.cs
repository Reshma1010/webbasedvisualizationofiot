using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class SensorDatum
    {
        public long IdSensorData { get; set; }
        public DateTime? TimeStamp { get; set; }
        public double? Value { get; set; }
        public long? FkIdUnit { get; set; }
        public long? FkIdDataType { get; set; }
        public long? FkIdSensor { get; set; }
        public long? FkIdLocation { get; set; }

        public virtual DataType? FkIdDataTypeNavigation { get; set; }
        public virtual Location? FkIdLocationNavigation { get; set; }
        public virtual Sensor? FkIdSensorNavigation { get; set; }
        public virtual Unit? FkIdUnitNavigation { get; set; }
    }
}
