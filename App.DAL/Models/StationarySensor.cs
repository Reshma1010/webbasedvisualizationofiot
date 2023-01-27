using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class StationarySensor
    {
        public int Id { get; set; }
        public int FloorNo { get; set; }
        public int Xaxis { get; set; }
        public int Yaxis { get; set; }
        public string? SensorId { get; set; }
        public string? Status { get; set; }
    }
}
