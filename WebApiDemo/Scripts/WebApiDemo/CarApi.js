var webApiDemoCarApi = (function($) {
    'use strict';

    var carApi = {};

    function getAllCars(successFunction) {
        return $.get('api/cars/getall', function(data) {
            successFunction(data);
        });
//        return $.ajax({
//            type: 'GET',
//            url: 'api/cars/getall', 
//            success: function(data) {
//                successFunction(data);
//            }
//        });
    }

    function addNewCar(car) {
        return $.ajax({
            type: 'POST',
            url: 'api/cars/create',
            data: car
        });
    }

    function filterCars(searchString, successFunction) {
        return $.ajax({
            type: 'POST',
            url: 'api/cars/filter',
            data: searchString,
            success: function (data) {
                successFunction(data);
            }
        });
    }

    carApi.getAllCars = function (successFunction) {
        return getAllCars(successFunction);
    };

    carApi.addNewCar = function (car) {
        return addNewCar(car);
    };

    carApi.filterCars = function (searchString, successFunction) {
        return filterCars(searchString, successFunction);
    };

    return carApi;
}(jQuery));