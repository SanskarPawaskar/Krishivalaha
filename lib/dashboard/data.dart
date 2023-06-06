import 'dart:ffi';

import 'package:communityapp/dashboard/dashboard.dart';
import 'package:communityapp/weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AllData {


//location data
  late String lat;
  late String long;

  //Weather data
  late String currentTemp;
  late String desc;
  late String windSpeed;
  late String humidity;
  late String preassure;
  late String cityName;
  late String icon;

//Function to get location
  Future<void> getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String latitude = position.latitude.toString();
    String longitude = position.longitude.toString();
    // Getting latitude and longitude
    lat = latitude;
    long = longitude;
  }

  

//Method for getting basic weather data
  Future<void> getWeatherdata(String lat, String long) async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=f8ec8e9f9624de6f8dad5b43922ae5f6'));
    Map data = jsonDecode(response.body);

    //Getting current temp,pressure,humidity
    Map main = data['main'];
    double tempinKel = main['temp'];
    print(tempinKel);
    double temptoCel = (tempinKel - 273.15); //C = K - 273.15
    print(temptoCel);
    int tempInt = temptoCel.round();
    print(tempInt);
    String getTemp = tempInt.toString();
    String getHumidity = main['humidity'].toString();
    String getPressure = main['pressure'].toString();

    // Get description
    List weather = data['weather'];
    String getdesc = weather[0]["description"];
    String geticon = weather[0]["icon"];

    //Get Wind speed
    Map wind = data['wind'];
    String getWindSpeed = wind['speed'].toString();

    //City anem
    String getCityName = data['name'];

    //Assigning Weather values
    currentTemp = getTemp;
    desc = getdesc;
    windSpeed = getWindSpeed;
    humidity = getHumidity;
    preassure = getPressure;
    cityName = getCityName;
    icon = geticon;
  }
  //Method for setting all the data
  Future<void> setData() async {
    Dashboard.temperature = currentTemp;
    Dashboard.description = desc;
    WeatherPage.temp = currentTemp;
    WeatherPage.description = desc;
    WeatherPage.cityName = cityName;
    WeatherPage.windSpeed = windSpeed;
    WeatherPage.humidity =humidity;
    WeatherPage.pressure =preassure;
    WeatherPage.icon = icon;
  }
}