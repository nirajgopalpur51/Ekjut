import 'package:get/get.dart';
import 'package:login_backend/Controller/LocationController.dart';
class LocationBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => LocationController());
  }
}