using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using WebApiDemo.Models;
using WebApiDemo.Models.Input;
using WebApiDemo.Service;

namespace WebApiDemo.ApiControllers
{  
    public class CarApiController : ApiController
    {
        private static readonly CarRepository CarRepository = new CarRepository();

        [HttpGet]
        [Route("api/cars/getall")]
        public List<Car> GetAllCars()
        {
            return CarRepository.GetAll();
        }

        [HttpPost]
        [Route("api/cars/create")]
        public void CreateCar(Car car)
        {
            CarRepository.Create(car);
        }

        [HttpPost]
        [Route("api/cars/filter")]
        public List<Car> FilterCars(FilterCarsInputModel model)
        {
            var cars = CarRepository.GetAll();

            var searchString = model.SearchString.ToLower();

            return cars.Where(car => car.Year.ToLower().Contains(searchString) || car.Make.ToLower().Contains(searchString) || car.Model.ToLower().Contains(searchString)).ToList();
        }
    }
}