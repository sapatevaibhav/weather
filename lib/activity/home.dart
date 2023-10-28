import 'dart:math';
import "package:weather_icons/weather_icons.dart";
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // Runs after initializing
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  void dispose() {
    // Runs after deletion
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TO grab the data thrown by parent method from loading screen
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = info['temp'],
        icon = info["icon"],
        cityName = capitalizeFirstLetter(info["city"]),
        humidity = info["humi"],
        air = info["air"],
        weather = info["weather"],
        description = capitalizeFirstLetter(info["desc"]);

    var cityNames = [
      "Mumbai",
      "Pune",
      "Delhi",
      "Chennai",
      "Lucknow",
      "Kolkata",
      "Bengaluru"
    ];
    final random = Random();
    var city = cityNames[random.nextInt(cityNames.length)];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [Colors.red, Colors.orange, Colors.yellow],
                    stops: const [.0, .6, 1])),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  // Container for search
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          performSearch();
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Icon(Icons.search),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search for $city...",
                          ),
                          onSubmitted: (value) {
                            performSearch();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          // Container for weather description
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(.3),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 13),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.network(
                                  "https://openweathermap.org/img/wn/$icon@2x.png"),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    weather,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("In $cityName")
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        // Container for Temperature
                        height: 155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(.3),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  temp,
                                  style: TextStyle(
                                      fontSize: 75,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "°C",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        // Container for wind speed
                        height: 155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(.3),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(WeatherIcons.strong_wind),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              air,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text("kmph")
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 155,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(.3),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              humidity,
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.bold),
                            ),
                            Text("%")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(.3),
                        ),
                        margin:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "$description in $cityName.",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 44.2,
                ),
                Text("Data provided by openweathermap.org",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.w300)),
                Text("Created by Vaibhav 🧡",
                    style:
                        TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 25,
                ),
              ],
            )),
      ),
    );
  }

  void performSearch() {
    if (searchController.text.replaceAll(" ", "") == "") {
      // Do nothing or display an error message.
    } else {
      Navigator.pushReplacementNamed(context, "/loading", arguments: {
        "searchText": searchController.text.replaceAll(" ", ""),
      });
    }
  }
}


String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Return the input string unchanged if it's empty.
  }
  return input[0].toUpperCase() + input.substring(1);
}
