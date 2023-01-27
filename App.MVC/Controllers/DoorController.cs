using App.DAL.DBContext;
using App.MVC.Services.DoorService;
using App.MVC.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace App.MVC.Controllers
{
    public class DoorController : Controller
    {
        private readonly DoorService _doorService;
        public DoorController(DoorService doorService)
        {
            _doorService = doorService;
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetByID(int id)
        {
            var result = _doorService.GetByID(id);
            return PartialView("~/Views/Modals/_DoorInfoModal.cshtml", result);
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetAllDoorsState()
        {
            var doorList = _doorService.GetAllDoorsState();
            return new JsonResult(new { doorList });
        }
    }
}
