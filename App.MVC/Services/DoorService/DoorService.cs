using App.DAL.DBContext;
using App.MVC.ViewModels;
namespace App.MVC.Services.DoorService
{
    public class DoorService
    {
        public DoorInfoVM GetByID(int id)
        {
            DoorInfoVM model = new DoorInfoVM();
            try
            {
                using (var _dbContext = new MiddlewareContext())
                {
                    var data = _dbContext.DoorInfos.FirstOrDefault(x => x.Idx == id);
                    if (data != null)
                    {
                        model.Idx = data.Idx;
                        model.Name = data.Name;
                        model.Description = data.Description;
                        model.IpAddress = data.IpAddress;
                        model.Port = data.Port;
                        model.Channel = data.Channel;
                        model.ChannelSensorOpened = data.ChannelSensorOpened;
                        model.StatusCoil = data.StatusCoil;
                        if (data != null)
                        {
                            if (data.StatusSensorClosed == true && data.StatusSensorOpened == true)
                            {
                                model.DoorStatus = "Closed";
                            }
                            else if (data.StatusSensorClosed == false && data.StatusSensorOpened == false)
                            {
                                model.DoorStatus = "Opened";
                            }
                            else
                            {
                                model.DoorStatus = "Partially-Opened";
                            }
                        }
                    }
                }
                return model;
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        public List<DoorInfoVM> GetAllDoorsState()
        {
            List<DoorInfoVM> model = new List<DoorInfoVM>();
            try
            {
                using (var _dbContext = new MiddlewareContext())
                {
                    var data = _dbContext.DoorInfos.ToList();
                    foreach (var item in data)
                    {
                        DoorInfoVM door = new DoorInfoVM();
                        if (item.StatusSensorClosed == true && item.StatusSensorOpened == true)
                        {   
                            door.DoorStatus = "Closed";
                        }
                        else if (item.StatusSensorClosed == false && item.StatusSensorOpened == false)
                        {
                            door.DoorStatus = "Opened";
                        }
                        else
                        {
                            door.DoorStatus = "Partially-Opened";
                        }
                        door.Idx = item.Idx;
                        model.Add(door);
                    }
                }
                return model;
            }
            catch(Exception ex)
            {
                throw;
            }
        }
    }
}
