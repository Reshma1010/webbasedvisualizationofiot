namespace App.MVC.ViewModels
{
    public class QuasiDetailModelVM
    {
        public SensorVM? SensorInfo { get; set; }
        public IEnumerable<QuasiVM>? SensorData { get; set; }
    }
}
