import 'package:flutter/material.dart';
import 'package:weather/activity/home.dart';
import 'package:weather/activity/location.dart';
import 'package:weather/activity/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => Loading(),
      "/home": (context) => Home(),
      "/loca": (context) => Location(),
      "/loading": (context) => Loading(),
    },
  ));
}
