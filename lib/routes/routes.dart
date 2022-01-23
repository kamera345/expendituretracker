import 'package:expendituretracker/resources/input_data.dart';
import 'package:expendituretracker/views/data_input.dart';
import 'package:expendituretracker/views/home_screen.dart';
import 'package:expendituretracker/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String splashScreen = '/splash_screen';
  static const String dataInputScreen = '/data_input_screen';
  static const String homeScreen = '/home_screen';

  static Map<String, Widget Function(BuildContext contetxt)> routes() => {
        Routes.splashScreen: (context) => const SplashScreen(),
        Routes.dataInputScreen: (context) => const InputData(),
        Routes.homeScreen: (context) => const HomeScreen(),
      };

  static PageRoute? onGenerateRoute(RouteSettings settings) {}
}
