using System.Numerics;

namespace App.MVC.ViewModels
{
    public class QuasiVM
    {
        public int Record_Id { get; set; }
        public DateTime Sensor_Date { get; set; }
        public decimal Value { get; set; }
        public string Unit { get; set; }
        public string Data_Type { get; set; }
        public string Sensor_Name { get; set; }
        public string Location { get; set; }
        public string Sensor_Id { get; set; }
    }
}
