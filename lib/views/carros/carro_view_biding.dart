import 'package:get/get.dart';

import 'carro_cotroller.dart';
import 'detalheCarro/detalheCarro_controller.dart';
import 'formCarro/formCarro_controller.dart';

class CarroViewBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CarroController>(() => CarroController());
    Get.lazyPut<FormCarroController>(() => FormCarroController());
    Get.lazyPut<DetalheCarroController>(() => DetalheCarroController());
    // Get.put<CarroController>(CarroController());
  }
}