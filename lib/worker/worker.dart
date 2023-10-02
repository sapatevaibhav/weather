import 'dart:convert';
import 'package:http/http.dart';

class worker {
  // Initialization of variables which stores the important data we have to use further
  String location = "Error!",
      temperature = "N/A",
      humidity = "N/A",
      airSpeed = "N/A",
      weatherr = "Can't find data ",
      icon = "03d",
      description = "Can't find data ";

  // Get the city location such that it can be used to get weather data from API
  worker({required this.location}) {
    location = location;
  }

//   dynamic getTime() async {
//     // Get API data
//     // To fetch time from worldtimeapi

//     Response response = await get(
//         Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Kolkata"));
//     Map data = jsonDecode(response.body);
//     var date = (data["datetime"]).toString();
//     int contain = date.indexOf('T');

//     date = date.substring(0, contain);
//     print(date);
//   }

  Future<void> getWeather() async {
    // Fetch the data from API
    try {
      Response weather = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=af37589d237c4246eb7ec7a13e6daec9"));
      if (weather.statusCode == 200) {
        Map weather1 = jsonDecode(weather.body);

        // Fetching weather data from fetched data
        List weatherData = weather1['weather'];
        Map weatherMainData = weatherData[0];

        // Fetching temperature, humidity and air speed
        Map temp = weather1['main'];
        temperature = (temp['temp'] - 273.15)
            .toStringAsFixed(1); // convert kelvin to celcius

        Map wind = weather1['wind'];
        airSpeed = (wind['speed'] / 0.2777778)
            .toStringAsFixed(1); // convert mpsec to kmph
        humidity = temp['humidity'].toString();

        //Fetching description
        weatherr = weatherMainData['main'];
        description = weatherMainData['description'];

        // Fetch weather type icon
        icon = weatherMainData["icon"].toString();
      } else {
        // Just pass the else block you dumb
      }
    } catch (e) {
      // Handle the error gracefully
      // That means pass this block too
    }
  }
}

