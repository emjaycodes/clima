import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = 'e61e01138cc4ae514d88cb9b9ab211d2';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';


  double latitude= 0;
  double longitude= 0; 

class WeatherModel {
  Future<dynamic> getLocationWeather()async{
      Location location = Location(latitude,longitude);
  await location.getCurrentLocation();


  latitude = location.latitude; 
  longitude = location.longitude;



  NetworkHelper networkHelper = NetworkHelper("$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

  var weatherData = await networkHelper.getData();
  return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
