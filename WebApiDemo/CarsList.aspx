<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CarsList.aspx.cs" Inherits="WebApiDemo.CarsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<fieldset>
    <legend>Filter</legend>
    <label for="FilterInput">Search</label>
    <input type="text" id="FilterInput"/>
    <button type="button" id="SearchButton">Search</button>
    <button type="button" id="ClearButton">Clear</button>
</fieldset>
<br>
<fieldset>
    <legend>Car Database</legend>
    <div id="CarList"></div>
</fieldset>
<br>
<fieldset>
    <legend>Register New Car</legend>
    <ul>
        <li>
            <label for="CarYearInput">Year</label>
            <input type="text" id="CarYearInput"/>
        </li>
        <li>
            <label for="CarMakeInput">Make</label>
            <input type="text" id="CarMakeInput"/>
        </li>
        <li>
            <label for="CarModelInput">Model</label>
            <input type="text" id="CarModelInput"/>
        </li>
    </ul>
    <button id="AddCarButton" type="button">Add Car</button>
</fieldset>
</body>
</html>

<script src="/Scripts/jquery-1.10.2.min.js"></script>
<script src="/Scripts/WebApiDemo/CarApi.js"></script>
<script>
    
    function listCars(cars) {
        var $carsList = $('#CarList');

        $carsList.empty();
        $.each(cars, function (i, v) {
            $carsList.append('<div>' + v.Year + ' ' + v.Make + ' ' + v.Model + '</div>');
        });
    }

    $(document).ready(function() {
        webApiDemoCarApi.getAllCars(listCars);
    });

    $('#AddCarButton').click(function () {
        var car = {
            Make: $('#CarMakeInput').val(),
            Model: $('#CarModelInput').val(),
            Year: $('#CarYearInput').val()
        };

        webApiDemoCarApi.addNewCar(car, listCars).then(function () {
            $('#CarYearInput').val('');
            $('#CarMakeInput').val('');
            $('#CarModelInput').val('');

            webApiDemoCarApi.getAllCars(listCars);
        });
    });

    $('#SearchButton').click(function () {
        var model = {
            SearchString: $('#FilterInput').val()
        };

        webApiDemoCarApi.filterCars(model, listCars);
    });

    $('#ClearButton').click(function() {
        webApiDemoCarApi.getAllCars(listCars);
        $('#FilterInput').val('');
    });

</script>