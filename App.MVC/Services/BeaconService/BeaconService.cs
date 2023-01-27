using App.DAL.DBContext;
using App.MVC.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace App.MVC.Services.BeaconService
{
    public class BeaconService
    {
        public BeaconSensorVM GetByID(int id)
        {
            BeaconSensorVM model = new BeaconSensorVM();
            try
            {
                using (var _dbContext = new MiddlewareContext())
                {
                    var data = _dbContext.BeaconSensors.FirstOrDefault(x => x.Id == id);
                    if (data != null)
                    {
                        model.Id = data.Id;
                        model.SensorId = data.SensorId;
                        model.FloorNo = data.FloorNo;
                        model.Xaxis = data.Xaxis;
                        model.Yaxis = data.Yaxis;
                        model.Status = data.Status;
                        model.Xheight = data.Xheight;
                        model.Ywidth = data.Ywidth;
                        model.Description = data.Description;
                    }
                    return model;
                }
            }
            catch(Exception ex)
            {
                throw;
            }
        }
    }
}
