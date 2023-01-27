using System;
using System.Collections.Generic;

namespace App.DAL.Models
{
    public partial class RoomInfo
    {
        public int RoomId { get; set; }
        public int FloorNumber { get; set; }
        public int RooomName { get; set; }
        public int SensorCapacity { get; set; }
        public bool IsAbove { get; set; }
        public int LeftTopX { get; set; }
        public int LeftTopY { get; set; }
        public int RightTopX { get; set; }
        public int RightTopY { get; set; }
        public int LeftBottomX { get; set; }
        public int LeftBottomY { get; set; }
        public int RightBottomX { get; set; }
        public int RightBottomY { get; set; }
    }
}
