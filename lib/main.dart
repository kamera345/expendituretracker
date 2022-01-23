import 'package:expendituretracker/resources/strings/app_strings.dart';
import 'package:expendituretracker/routes/routes.dart';
import 'package:expendituretracker/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.title,
      home: const SplashScreen(),
      routes: Routes.routes(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
