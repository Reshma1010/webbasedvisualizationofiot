using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class Unit
    {
        public Unit()
        {
            SensorData = new HashSet<SensorDatum>();
        }

        public long IdUnit { get; set; }
        public string? Abbreviation { get; set; }
        public string? Designation { get; set; }
        public string? Description { get; set; }
        public string? Translate { get; set; }

        public virtual ICollection<SensorDatum> SensorData { get; set; }
    }
}
