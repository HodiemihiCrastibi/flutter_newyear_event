import 'package:get/get.dart';

class DistanceController extends GetxController {
  double _distance = 100;
  double get distance => _distance;

  bool _heart = false;
  bool get heart => _heart;

  void getClose() {
    if (_distance == 0) {
      _heart = true;
      update();
      Future.delayed(const Duration(milliseconds: 500), () {
        _heart = false;
        update();
      });
      Get.put(DistanceController());
      final controller = Get.find<DistanceController>();
      return;
    }
    _distance -= 20;
    update();
  }

  void getFar() {
    _distance += 20;
    update();
  }
}