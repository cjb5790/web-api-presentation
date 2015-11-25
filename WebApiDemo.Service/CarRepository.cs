using System.Collections.Generic;
using System.Linq;
using WebApiDemo.Models;

namespace WebApiDemo.Service
{
    public class CarRepository
    {
        private static List<Car> _cars;

        public CarRepository()
        {
            _cars = new List<Car>
            {
                new Car {Id = 1, Make = "Volkswagen", Model = "Tiguan", Year = "2015"},
                new Car {Id = 2, Make = "Toyota", Model = "Rav4", Year = "2015"},
                new Car {Id = 3, Make = "Bugatti", Model = "Veyron", Year = "2016"},
                new Car {Id = 4, Make = "BMW", Model = "x5", Year = "2013"},
                new Car {Id = 5, Make = "Ford", Model = "Mustang", Year = "1966"}
            };
        }

        public List<Car> GetAll()
        {
            return _cars;
        }

        public Car Get(int id)
        {
            return _cars.FirstOrDefault(c => c.Id == id);
        }

        public int Create(Car car)
        {
            car.Id = GetAll().Count + 1;
            _cars.Add(car);
            return car.Id;
        }
    }
}