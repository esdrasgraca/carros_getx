import 'package:get/get.dart';

import 'carro_cotroller.dart';

class CarroViewBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CarroController>(() => CarroController());
    // Get.put<CarroController>(CarroController());
  }
}