using App.DAL.Models;
using App.MVC.Services.MapperService;
using AutoMapper;
using System;
using System.Collections.Generic;

namespace App.MVC.ViewModels
{
    public partial class StationarySensorVM : IMapFrom<StationarySensorVM>
    {
        public long IdSensor { get; set; }

        public int Index { get; set; }
        public double? X { get; set; }
        public double? Y { get; set; }

        public string? DatatType { get; set; }
        public string? Unit { get; set; }
        public decimal? Value { get; set; }


        public string? SensorSerialNumber { get; set; }
        public string? SensorDesignation { get; set; }
        public bool? Active { get; set; }
        public string? Remark { get; set; }
        public long? FkIdSensorDevice { get; set; }
        public int? RoomNo { get; set; }
        public int? FloorNo { get; set; }
        public bool IsAbove { get; set; }
        
        public int? MarginTop { get; set; }
        public int? MarginLeft { get; set; }
        

        public void Mapping(Profile profile)
        {
            profile.CreateMap<Sensor, StationarySensorVM>();
            profile.CreateMap<StationarySensorVM, Sensor>();
        }
    }
}
