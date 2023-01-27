using App.MVC.Services.DoorService;
using App.MVC.Services.FloorService;
using App.MVC.Services.QuasiService;
using App.MVC.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System.Runtime.Serialization;
using System.Xml.Linq;

namespace App.MVC.Controllers
{
    public class QuasiController : Controller
    {
        private readonly QuasiService _quasiService;
        public QuasiController(QuasiService quasiService)
        {
            _quasiService = quasiService;
        }
        public IActionResult QuasiData()
        {
           var result= _quasiService.GetAllSensor();
            return View(result);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetById(int id)
        {
            ViewBag.SensorId = id;
            return PartialView("~/Views/Modals/_AssignLocationModal.cshtml");
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetSensorData(int id)
        {
            var result = _quasiService.GetSensorData(id);
            ViewBag.SensorId = id;
            if (result.Count != 0)
            {
                ViewBag.SensorDate = result[0].Sensor_Date.ToString("yyyy-MM-dd HH:mm:ss");
            }

            return PartialView("~/Views/Modals/_QuasiInfoModal.cshtml", new QuasiDetailModelVM
            {
                SensorInfo = _quasiService.GetByID(id),
                SensorData = result,
            });
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetSensorDataByDate(string from,string to,int id)
        {
            GeneralResponseModel response = new GeneralResponseModel();
            var differenceDate = Convert.ToDateTime(to) - Convert.ToDateTime(from);
            if (differenceDate.Days > 10)
            {
                response.Success = false;
                response.Message = "Data Limit for given Date range is exceeding, please choose a shorter Date range.";
            }
            else
            {
                var result = _quasiService.GetSensorDataByDate(from, to, id);
                response.Success = true;
                response.Result = result;
            }
            return Json(response);
        }
        [HttpPost]
        [AllowAnonymous]
        public IActionResult AssignRoomToSensor(int roomNo,int sensorId)
        {
            var result = _quasiService.AssignRoomToSensor(roomNo,sensorId);
            return Json(result);
        }
        [HttpPost]
        [AllowAnonymous]
        public IActionResult UnassignRoomToSensor(int sensorId)
        {
            var result = _quasiService.UnassignRoomToSensor(sensorId);
            return Json(result);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetSensorCoordinates(int id)
        {
            var result = _quasiService.GetByID(id);
            ViewBag.SensorId = id;
            return PartialView("~/Views/Modals/_UpdateQuasiSensorCoordinates.cshtml", result);
        }
        [HttpPost]
        [AllowAnonymous]
        public IActionResult UpdateCoordinates(int sensorId, int XHeight, int YWidth)
        {
            var result = _quasiService.UpdateCoordinates(sensorId, XHeight, YWidth);
            return Json(result);
        }
    }
}
