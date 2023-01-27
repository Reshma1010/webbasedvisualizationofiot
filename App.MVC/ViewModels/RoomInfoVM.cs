using App.DAL.Models;
using App.MVC.Services.MapperService;
using AutoMapper;

namespace App.MVC.ViewModels
{
    public class RoomInfoVM : IMapFrom<RoomInfoVM>
    {
        public int RoomId { get; set; }
        public int RooomName { get; set; }
        public int SensorCapacity { get; set; }
        public bool IsAbove { get; set; }
        public int MarginLeftA { get; set; }
        public int MarginTopA { get; set; }
        public int MarginLeftB { get; set; }
        public int MarginTopB { get; set; }
        public int MarginLeftD { get; set; }
        public int MarginTopCD { get; set; }
        public int MarginLeftC { get; set; }
        public int RightBottomY { get; set; }

        public void Mapping(Profile profile)
        {
            profile.CreateMap<RoomInfo, RoomInfoVM>()
                .ForMember(dst => dst.MarginLeftA, src => src.MapFrom(trg => trg.LeftTopX))
                .ForMember(dst => dst.MarginTopA, src => src.MapFrom(trg => trg.LeftTopY))
                .ForMember(dst => dst.MarginLeftB, src => src.MapFrom(trg => trg.RightTopX))
                .ForMember(dst => dst.MarginTopB, src => src.MapFrom(trg => trg.RightTopY))
                .ForMember(dst => dst.MarginLeftD, src => src.MapFrom(trg => trg.LeftBottomX))
                .ForMember(dst => dst.MarginTopCD, src => src.MapFrom(trg => trg.LeftBottomY))
                .ForMember(dst => dst.MarginLeftC, src => src.MapFrom(trg => trg.RightBottomX))
                .ForMember(dst => dst.RightBottomY, src => src.MapFrom(trg => trg.RightBottomY));

    }
    }
}
