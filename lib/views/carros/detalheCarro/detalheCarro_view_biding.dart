import 'package:carros_getx/views/carros/detalheCarro/detalheCarro_controller.dart';
import 'package:carros_getx/views/carros/formCarro/formCarro_controller.dart';
import 'package:get/get.dart';


class DetalheCarroViewBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DetalheCarroController>(() => DetalheCarroController());
    Get.lazyPut<FormCarroController>(() => FormCarroController());
    // Get.put<CarroController>(CarroController());
  }
}