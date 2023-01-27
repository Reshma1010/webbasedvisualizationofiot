namespace App.MVC.ViewModels
{
    public class SensorVM
    {
        public int Id { get; set; }
        public string? SerialNumber { get; set; }
        public string? Designation { get; set; }
        public bool? Active { get; set; }
        public string? Remark { get; set; }
        public string? SensorDevice { get; set; }
        public int? FloorNo { get; set; }
        public int? RoomNo { get; set; }
        public int? Xheight { get; set; }
        public int? YWidth { get; set; }
    }
}
