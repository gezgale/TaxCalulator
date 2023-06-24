using Microsoft.AspNetCore.Mvc;
using Interfaces;
using TaxCalulator.AppDbContext;

namespace Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CongestionTaxCalculatorController : ControllerBase
    {
        private readonly ICongestionTaxCalculator _iCongestionTaxCalculator;
        private readonly ApplicationDbContext _ApplicationDbContext;

        public CongestionTaxCalculatorController(ApplicationDbContext applicationDbContext,
            ICongestionTaxCalculator iCongestionTaxCalculator)
        {
            this._ApplicationDbContext = applicationDbContext;
            this._iCongestionTaxCalculator = iCongestionTaxCalculator;
        }
    }


}
