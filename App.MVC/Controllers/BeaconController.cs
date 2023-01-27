using App.DAL.DBContext;
using App.MVC.Services.BeaconService;
using App.MVC.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace App.MVC.Controllers
{
    public class BeaconController : Controller
    {
        private readonly BeaconService _beaconService;
        public BeaconController(BeaconService beaconService)
        {
            _beaconService = beaconService;
        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult GetByID(int id)
        {
            var result = _beaconService.GetByID(id);
            return PartialView("~/Views/Modals/_BeaconInfoModal.cshtml", result);
        }
    }
}
