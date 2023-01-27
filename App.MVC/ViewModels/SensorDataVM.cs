namespace App.MVC.ViewModels
{
    public class SensorDataVM
    {
        public List<DoorInfoVM>? Door { get; set; }
        public List<BeaconSensorVM>? BeaconSensor { get; set; }
        public List<StationarySensorVM>? StationarySensor { get; set; }
        public List<MobileRobotVM>? MobileRobot { get; set; }
    }
}
