using App.DAL.Models;
using App.MVC.Services.MapperService;
using AutoMapper;
using System;
using System.Collections.Generic;

namespace App.MVC.ViewModels
{
    public partial class BeaconSensorVM : IMapFrom<BeaconSensorVM>
    {
        public int Id { get; set; }
        public int FloorNo { get; set; }
        public int Xaxis { get; set; }
        public int Yaxis { get; set; }
        public string? SensorId { get; set; }
        public string? Status { get; set; }

        public int Xheight { get; set; }
        public int Ywidth { get; set; }
        public string? Description { get; set; }
        public void Mapping(Profile profile)
        {
            profile.CreateMap<BeaconSensor, BeaconSensorVM>();
            profile.CreateMap<BeaconSensorVM, BeaconSensor>();
        }
    }
}
