using AutoMapper;

namespace App.MVC.Services.MapperService;

public interface IMapFrom<T>
{
    void Mapping(Profile profile) => profile.CreateMap(typeof(T), GetType());
}