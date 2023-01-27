using App.DAL.Models;
using App.MVC.Services.MapperService;
using AutoMapper;

namespace App.MVC.ViewModels
{
    public class DoorInfoVM : IMapFrom<DoorInfoVM>
    {
        public long Idx { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public string? IpAddress { get; set; } 
        public int? Port { get; set; }
        public byte? Channel { get; set; }
        public byte? ChannelSensorOpened { get; set; }
        public bool? StatusCoil { get; set; }
        public string? DoorStatus { get; set; }
        public bool? StatusSensorClosed { get; set; }
        public bool? StatusSensorOpened { get; set; }
        public int? XAxis { get; set; }
        public int? YAxis { get; set; }

        public void Mapping(Profile profile)
        {
            profile.CreateMap<DoorInfoVM, DoorInfo>();
            profile.CreateMap<DoorInfo, DoorInfoVM>();
        }
    }
}
