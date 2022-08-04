using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace UberMicroserviceManagement.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PassengerController : ControllerBase
    {
        public List<Passenger> passList = new List<Passenger>()
        {
            new Passenger(){PassengerId = 1,PassengerName = "Alpha", PassengerRating = 5},
            new Passenger(){PassengerId = 2,PassengerName = "DriverB", PassengerRating = 3}
        };
        // GET: api/<PassengerController>
        [HttpGet]
        public IEnumerable<Passenger> Get()
        {
            return passList;
        }

        // GET api/<PassengerController>/5
        [HttpGet("{id}")]
        public Passenger Get(int id)
        {
            Passenger obj = passList.Find(i => i.PassengerId == id);
            return obj;
        }

        // POST api/<PassengerController>
        [HttpPost]
        public List<Passenger> Post([FromBody] Passenger obj)
        {
            passList.Add(obj);
            return passList;
        }

        // PUT api/<PassengerController>/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] Passenger obj)
        {
            Passenger preO = passList.Find(i => i.PassengerId == id);
            if (preO != null)
            {
                passList.Insert(id - 1, obj);
                return Ok();
            }
            return NotFound("Obj not found");
        }

        // DELETE api/<DriverController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            Passenger preO = passList.Find(i => i.PassengerId == id);
            if (preO != null)
            {
                passList.Remove(preO);
                return Ok();
            }
            return NotFound("Obj not found");
        }
    }
}
