using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace DriverManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DriverController : ControllerBase
    {
        // GET: api/<DriverController>
        public List<Driver> driverList = new List<Driver>()
        { 
            new Driver(){DriverId = 1,DriverName = "DriverA", DriverRating = 5},
            new Driver(){DriverId = 2,DriverName = "DriverB", DriverRating = 3}
        };
        [HttpGet]
        public IEnumerable<Driver> Get()
        { 
            return driverList;
        }

        // GET api/<DriverController>/5
        [HttpGet("{id}")]
        public Driver Get(int id)
        {
            Driver obj = driverList.Find(i => i.DriverId == id);
            return obj;
        }

        // POST api/<DriverController>
        [HttpPost]
        public List<Driver> Post([FromBody] Driver obj)
        {
            driverList.Add(obj);
            return driverList;
        }

        // PUT api/<DriverController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] Driver obj)
        {
            Driver preO = driverList.Find(i => i.DriverId == id);
            if (preO != null)
            {
                driverList.Insert(id - 1, obj);
                return Ok();
            }
            return NotFound("Obj not found");
        }

        // DELETE api/<DriverController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Driver preO = driverList.Find(i => i.DriverId == id);
            if (preO != null)
            {
                driverList.Remove(preO);
                return Ok();
            }
            return NotFound("Obj not found");
        }
    }
}
