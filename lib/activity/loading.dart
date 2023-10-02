// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather/worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

String city = "Pune",
    temperature = "",
    humidity = "",
    airSpeed = "",
    weatherr = "",
    description = "",
    icon = "";

class _LoadingState extends State<Loading> {
  void startApp(String city) async {
    // create worker object by giving the city name to it
    worker instance = worker(location: city);
    // Wait to get the weather data
    await instance.getWeather();

    setState(() {
      // Fetch data from the worker and store it into variables
      temperature = instance.temperature;
      humidity = instance.humidity;
      airSpeed = instance.airSpeed;
      weatherr = instance.weatherr;
      description = instance.description;
      icon = instance.icon;

      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/home', arguments: {
          // To call the home 7rame as well as throw the grabbed data to it.
          "temp": temperature, // degree celcius
          "humi": humidity, // percentage
          "air": airSpeed, // kmph
          "weather": weatherr, // Weather param
          "desc": description, // Weather desc
          "icon": icon,
          "city": city
        });
      });
    });
  }

  @override
  void initState() {
    // Call the startApp method above which is responsible to fetch data from worker and throw that fetched data to home
    //startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
    if (search != null) {
      // Now you can safely work with the 'search' variable as a Map.
      city = search['searchText'];
    } else {
      // Handle the case where 'search' is null (e.g., provide a default value or error handling).
    }
    //  if(search.isNotEmpty)
    // {
    // }
    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 205),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [Colors.red, Colors.orange, Colors.yellow],
                  stops: const [.0, .3, 1])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "images/sunr.jpeg",
                  height: 275,
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Weather app",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text("Created by Vaibhav 🧡",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                SizedBox(
                  height: 20,
                ),
                SpinKitRipple(
                  color: Colors.orange,
                  size: 50.0,
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
