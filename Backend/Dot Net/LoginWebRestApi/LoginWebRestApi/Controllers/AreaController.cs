/*using LoginWebRestApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LoginWebRestApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreaController : ControllerBase
    {
        private readonly HospitalmanagementContext _context;

        public AreaController(HospitalmanagementContext context)
        {
            _context = context;
        }

        // GET: api/Area/{cityId}
        [HttpGet("getAreas/{cityId}")]
        public async Task<IActionResult> GetAreas(int cityId)
        {
            var areas = await _context.Areas
                .Where(a => a.Cityid == cityId)
                .Select(a => new { a.Cityid, a.Name })
                .ToListAsync();

            return Ok(areas);
        }
    }
}
*/


using LoginWebRestApi.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace LoginWebRestApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AreaController : ControllerBase
    {
        private readonly HospitalmanagementContext _context;

        public AreaController(HospitalmanagementContext context)
        {
            _context = context;
        }

        // GET: api/Area/getAreas/{cityId}
        [HttpGet("getAreas/{cityId}")]
        public async Task<IActionResult> GetAreas(int cityId)
        {
            // Validate the cityId
            if (cityId <= 0)
            {
                return BadRequest("Invalid city ID.");
            }

            // Fetch areas from the database
            var areas = await _context.Areas
                .Where(a => a.Cityid == cityId)
                .Select(a => new { a.Cityid, a.Name })
                .ToListAsync();

            // 
            if (areas == null || areas.Count == 0)
            {
                return NotFound("No areas found for the given city ID.");
            }

            return Ok(areas);
        }
    }
}
