import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/movie_detail.dart';
import './screens/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF2B313C),
          accentColor: Color(0xFF2072D5),
          scaffoldBackgroundColor: Color(0xFF2B313C),
          cardColor: Color(0xFF2E3851),
          brightness: Brightness.dark),
      home: HomeScreen(),
      routes: {
        "/search": (context) => SearchScreen(),
      },
      onGenerateRoute: (settings) {
        var splits = settings.name.split("/");
        switch (splits[1]) {
          case "movie":
            return MaterialPageRoute(
                builder: (context) => MovieDetail(splits[2]));

            break;
          default:
        }
      },
    );
  }
}
