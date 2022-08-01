import 'package:feedapp/screens/details_screen.dart';
import 'package:feedapp/screens/feed_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FeedHomeScreen(),
      ),
      routes: {
        FeedHomeScreen.routeName: (ctx) => FeedHomeScreen(),
        DetailsPostScreen.routeName: (ctx) => DetailsPostScreen(),
      },
    );
  }
}
