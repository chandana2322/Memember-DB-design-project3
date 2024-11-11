using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using project3WithDBFirstAndLinq.Models;

namespace project3WithDBFirstAndLinq.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AddressInformationController : ControllerBase
    {
        private readonly Projectsql3Context dbContext;

        public AddressInformationController(Projectsql3Context dbContext)
        {

            this.dbContext = dbContext;
        }


        [HttpGet("GetAllAddresses")]
        public async Task<IActionResult> GetAllAddresses()
        {
            try
            {
                var allAddresses = await dbContext.AddressInformations
                    .ToListAsync();
                return Ok(allAddresses);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpGet("GetAddress/{Uid}")]
        public async Task<IActionResult> GetAddress(int Uid)
        {
            try
            {
                var address = await dbContext.AddressInformations
                    .FirstOrDefaultAsync(x => x.Uid == Uid);

                if (address is null)
                    return NotFound("Address not found.");

                return Ok(address);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpPost("InsertAddress")]
        public async Task<IActionResult> InsertAddress(AddressInformation addressInformationmodel)
        {
            try
            {
                await dbContext.AddressInformations.AddAsync(addressInformationmodel);
                await dbContext.SaveChangesAsync();
                return Ok("Address inserted successfully.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpPut("UpdateAddress/{Uid}")]
        public async Task<IActionResult> UpdateAddress(int Uid, AddressInformation addressInformation)
        {
            try
            {
                var existingAddress = await dbContext.AddressInformations
                    .FirstOrDefaultAsync(x => x.Uid == Uid);

                if (existingAddress is null)
                    return NotFound("Address not found.");

                existingAddress.AddressLine1 = addressInformation.AddressLine1;
                existingAddress.AddressLine2 = addressInformation.AddressLine2;
                existingAddress.City = addressInformation.City;
                existingAddress.State = addressInformation.State;
                existingAddress.ZipCode = addressInformation.ZipCode;
                existingAddress.Country = addressInformation.Country;
                existingAddress.ResidentialStatus = addressInformation.ResidentialStatus;
                existingAddress.DurationOfStayYears = addressInformation.DurationOfStayYears;

                dbContext.AddressInformations.Update(existingAddress);
                await dbContext.SaveChangesAsync();

                return Ok("Address updated successfully.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }


        [HttpDelete("DeleteAddress/{Uid}")]
        public async Task<IActionResult> DeleteAddress(int Uid)
        {
            try
            {
                var existingAddress = await dbContext.AddressInformations
                    .FirstOrDefaultAsync(x => x.Uid == Uid);

                if (existingAddress is null)
                    return NotFound("Address not found.");

                dbContext.AddressInformations.Remove(existingAddress);
                await dbContext.SaveChangesAsync();

                return Ok("Address deleted successfully.");
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
