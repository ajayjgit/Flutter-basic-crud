import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  // Set the ErrorWidget's builder before the app is started.
  ErrorWidget.builder = (FlutterErrorDetails details) {
    // Your error handling logic goes here
    return ErrorWidget(details.exception);
  };

  // Start the app.
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OC',
      home: MyHomePage(),
    );
  }
}
