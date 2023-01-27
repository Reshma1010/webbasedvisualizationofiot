using App.MVC.Services.FloorService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace App.MVC.Controllers
{
    public class FloorController : Controller
    {
        private readonly FloorService _floorService;
        public FloorController(FloorService floorService)
        {
            _floorService = floorService;
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult FloorTwo()
        {
            var result = _floorService.GetSensorData(2);
            return View(result);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult FloorThree()
        {
            var result = _floorService.GetSensorData(3);
            return View(result);
        }
    }
}
