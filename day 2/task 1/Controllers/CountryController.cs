using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Day2Handson.Models;

namespace Day2Handson.Controllers
{
    //[RoutePrefix("api/Country")]
    public class CountryController : ApiController
    {
        static List<Country> Clist = new List<Country>()
        {
            new Country{Id=1,CountryName="India",Capital="Delhi"},
            new Country{Id=2,CountryName="United Kingdom",Capital="London"},
            new Country{Id=3,CountryName="USA",Capital="Washington"},
            new Country{Id=4,CountryName="Russia",Capital="Moscow"}
        };

        [HttpGet]
        //[Route("Clist")]

        public HttpResponseMessage GetCountryList()
        {
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, Clist);
            return response;
        }

        [HttpGet]
        //[Route("ById")]
        public HttpResponseMessage GetC(int cid)
        {
            var country = Clist.Find(x => x.Id == cid);

            if (country == null)
            {
                return Request.CreateResponse(HttpStatusCode.NotFound, cid);
            }
            return Request.CreateResponse(HttpStatusCode.OK, country);
        }

        public Country Post([FromBody] Country c)
        {
            Clist.Add(c);
            return c;
        }
        [HttpDelete]
       // [Route("Del")]
        public IHttpActionResult Delete(int id)
        {
            Country obj= Clist.Find(x => x.Id == id);
            if (obj == null)
            {
                return NotFound() ;
            }
            else
            {
                Clist.Remove(obj);
                return Ok(obj) ;
            }
        }

    }
}
