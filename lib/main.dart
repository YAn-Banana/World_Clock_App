import 'package:flutter/material.dart';
import 'package:world_clock_app/pages/home.dart';
import 'package:world_clock_app/pages/loading.dart';
import 'package:world_clock_app/pages/location.dart';

void main() => runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Loading(),
          '/home': (context) => const Home(),
          '/location': (context) => const Location(),
        }));
