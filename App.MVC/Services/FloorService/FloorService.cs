using App.DAL.DBContext;
using App.MVC.ViewModels;
using AutoMapper;
using Microsoft.EntityFrameworkCore;

namespace App.MVC.Services.FloorService
{
    public class FloorService
    {
        private readonly IMapper _mapper;
        public FloorService(IMapper mapper)
        {
            _mapper = mapper;
        }
        public SensorDataVM GetSensorData(int floor)
        {
            // all rooms (css : class => room) have same height as 100%, so their parents height is captured
            // parent (css : class => room-container) has height of 100px so we will be using this height for :
            // calculating distance of a sensor from wall having door
            // need to show in cm as 1 cm will be taken as 1 meter (scale)
            //1 px ≈ 0.026458 cm

            try
            {
                const int Hpx = 30;
                const int Lpx = 20;
                const double Kpx = 3.84; // Constant Difference
                using (var dbContext = new MiddlewareContext())
                {
                    var quasiSensors = new List<StationarySensorVM>();
                    var rooms = _mapper.Map<RoomInfoVM[]>(dbContext.RoomInfos.OrderBy(c => c.RooomName).Where(x => x.FloorNumber == floor).ToArray());
                    var prevRoomSensorOffset = 0;
                    for (int n = 0; n < rooms.Length; n++)
                    {
                        var quasi = dbContext.Sensors.Where(x => x.RoomNo == rooms[n].RooomName).ToArray();
                        for (int i = 0, j = quasi.Length; i < quasi.Length; i++, j--)
                        {
                            var thisSensorRoom = rooms[n];
                            if (thisSensorRoom != null)
                            {
                                var dataType = dbContext.DataTypes.FirstOrDefault(x => x.DataTypeDesignation.ToLower().Equals("tvoc"));
                                var quasiData = dbContext.SensorData.OrderByDescending(c => c.TimeStamp)
                                                                    .Include(x => x.FkIdDataTypeNavigation)
                                                                    .Include(x => x.FkIdUnitNavigation)
                                                                    .FirstOrDefault(x => x.FkIdSensor == quasi[i].IdSensor && x.FkIdDataType == dataType.IdDataType);

                                var sensor = _mapper.Map<StationarySensorVM>(quasi[i]);
                                sensor.IsAbove = i % 2 == 0;
                                sensor.MarginLeft = thisSensorRoom.MarginLeftA + prevRoomSensorOffset + (i * Lpx);
                                sensor.MarginTop = thisSensorRoom.MarginTopA + (i - j) - n;

                                sensor.Index = i;
                                sensor.Y = Math.Round(0.026458 * 100, 2);
                                sensor.X = Math.Round(0.026458 * ((i * Hpx) + Kpx), 2);

                                sensor.Value = Math.Round((decimal)(quasiData?.Value ?? 0), 2);
                                sensor.DatatType = quasiData?.FkIdDataTypeNavigation?.DataTypeDesignation ?? String.Empty;
                                sensor.Unit = quasiData?.FkIdUnitNavigation?.Abbreviation ?? String.Empty;
                                quasiSensors.Add(sensor);

                            }
                        }
                        prevRoomSensorOffset += (rooms[n].SensorCapacity * Lpx) - quasi.Length;
                    }

                    return new SensorDataVM
                    {
                        Door = _mapper.Map<List<DoorInfoVM>>(dbContext.DoorInfos.ToList()),
                        BeaconSensor = _mapper.Map<List<BeaconSensorVM>>(dbContext.BeaconSensors.Where(x => x.FloorNo == floor).ToList()),
                        StationarySensor = quasiSensors,
                        MobileRobot = _mapper.Map<List<MobileRobotVM>>(dbContext.MobileRobots.Where(x => x.FloorNo == floor).ToList())
                    };
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}
