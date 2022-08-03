using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using WebApplication4.Models;


namespace WebApplication4.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IEmployeeRepository emprepo;

        public HomeController(ILogger<HomeController> logger, IEmployeeRepository erep)
        {

            _logger = logger;
            emprepo = erep;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult AllEmp()
        {
            var model = emprepo.GetAllEmployees();
            return View(model);
        }
        [HttpGet]
        public IActionResult Create()
        {

            return View();
        }

        [HttpPost]
        public IActionResult Create(Employee obj)
        {
            emprepo.AddEmployee(obj);
            return RedirectToAction("Index");
        }

        public IActionResult Details(int id)
        {
            Employee obj = emprepo.GetEmployeeByID(id);
            return View(obj);
        }


        [HttpGet]
        public IActionResult Edit(int id)
        {
            Employee obj = emprepo.GetEmployeeByID(id);
            return View(obj);
        }

        [HttpPost]
        public IActionResult Edit(Employee obj)
        {
            emprepo.UpdateEmployee(obj);
            return RedirectToAction("Index");
        }


        [HttpGet]
        public IActionResult Delete(int id)
        {
            Employee obj = emprepo.GetEmployeeByID(id);
            return View(obj);
        }

        [HttpPost]
        [ActionName("Delete")]
        public IActionResult DeleteConfirm(int id)
        {
            emprepo.DeleteEmployee(id);
            return RedirectToAction("AllEmp");
        }
    }
}
