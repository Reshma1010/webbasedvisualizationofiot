using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class DataType
    {
        public DataType()
        {
            SensorData = new HashSet<SensorDatum>();
        }

        public long IdDataType { get; set; }
        public string? DataTypeDesignation { get; set; }
        public string? Remark { get; set; }

        public virtual ICollection<SensorDatum> SensorData { get; set; }
    }
}
