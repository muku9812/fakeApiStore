import 'package:flutter/material.dart';
import 'package:store/extra/controller.dart';
import 'package:store/extra/extra_page.dart';
import 'package:store/screens/homeScreen.dart';
import 'package:store/screens/splashScreen.dart';

void main() {
  print("object");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // GetApi getApi = GetApi();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("object");
    // getApi.getPostApi();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
