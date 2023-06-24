using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Interfaces;

namespace TaxCalulator.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehicleController : ControllerBase
    {
        private readonly IVehicle _iVehicle;
        public VehicleController(IVehicle iVehicle)
        {
            _iVehicle = iVehicle;
        }
    }
}
