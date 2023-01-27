using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class Location
    {
        public Location()
        {
            SensorData = new HashSet<SensorDatum>();
        }

        public long IdLocation { get; set; }
        public byte? CountOfDetectedBeacons { get; set; }
        public int? Beacon1Id { get; set; }
        public int? Beacon1RoomNum { get; set; }
        public short? Beacon1Rssimean { get; set; }
        public short? Beacon1Txpower { get; set; }
        public int? Beacon2Id { get; set; }
        public int? Beacon2RoomNum { get; set; }
        public short? Beacon2Rssimean { get; set; }
        public short? Beacon2Txpower { get; set; }
        public int? Beacon3Id { get; set; }
        public int? Beacon3RoomNum { get; set; }
        public short? Beacon3Rssimean { get; set; }
        public short? Beacon3Txpower { get; set; }
        public int? Beacon4Id { get; set; }
        public int? Beacon4RoomNum { get; set; }
        public short? Beacon4Rssimean { get; set; }
        public short? Beacon4Txpower { get; set; }
        public int? Beacon5Id { get; set; }
        public int? Beacon5RoomNum { get; set; }
        public short? Beacon5Rssimean { get; set; }
        public short? Beacon5Txpower { get; set; }
        public int? Beacon6Id { get; set; }
        public int? Beacon6RoomNum { get; set; }
        public short? Beacon6Rssimean { get; set; }
        public short? Beacon6Txpower { get; set; }

        public virtual ICollection<SensorDatum> SensorData { get; set; }
    }
}
