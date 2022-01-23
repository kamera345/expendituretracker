import 'package:expendituretracker/resources/data.dart';
import 'package:expendituretracker/resources/images/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Data extends ChangeNotifier {
  static double _value1 = 0;
  static double _value2 = 0;
  static double _value3 = 0;

  List<ChartData> chartData = [
    ChartData('Decorator', _value1, Images.decorator),
    ChartData('Photographer', _value2, Images.photographer),
    ChartData('Caterer', _value3, Images.caterer),
  ];

  void insertData(
      {required double one, required double two, required double three}) {
    _value1 = one;
    _value2 = two;
    _value3 = three;
    notifyListeners();
  }
}
