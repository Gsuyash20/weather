import 'package:weather/service/networking.dart';
import 'package:weather/service/location.dart';
import 'package:weather/api/api_key.dart';

String apikey = apiKey;
const String weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Location location = Location();

  Future <dynamic> getCityWeather(String cityName)async{
    NetworkHelp networkHelp = NetworkHelp(url: '$weatherApiUrl?q=$cityName&appid=$apiKey&units=metric');
    var weatherData =await networkHelp.getData();
    return weatherData;
  }

  Future<dynamic> getWeathers() async {
    await location.currentLocation();
    NetworkHelp networkHelp = NetworkHelp(
        url:
            '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await networkHelp.getData();
    print(location.longitude);
    print(location.latitude);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
