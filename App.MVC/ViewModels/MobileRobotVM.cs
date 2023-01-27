using App.DAL.Models;
using App.MVC.Services.MapperService;
using AutoMapper;
using System;
using System.Collections.Generic;

namespace App.MVC.ViewModels
{
    public partial class MobileRobotVM : IMapFrom<MobileRobotVM>
    {
        public int Id { get; set; }
        public int FloorNo { get; set; }
        public int Xaxis { get; set; }
        public int Yaxis { get; set; }
        public string? SensorId { get; set; }
        public string? Status { get; set; }
        public void Mapping(Profile profile)
        {
            profile.CreateMap<MobileRobotVM, MobileRobot>();
            profile.CreateMap<MobileRobot, MobileRobotVM>();
        }
    }
}
