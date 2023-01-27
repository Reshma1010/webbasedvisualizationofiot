using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class DoorInfo
    {
        public long Idx { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? IpAddress { get; set; }
        public int? Port { get; set; }
        public byte? Channel { get; set; }
        public byte? ChannelSensorOpened { get; set; }
        public bool? StatusCoil { get; set; }
        public bool? StatusSensorClosed { get; set; }
        public bool? StatusSensorOpened { get; set; }
    }
}
