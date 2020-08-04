import 'package:carros_getx/views/carros/formCarro/formCarro_controller.dart';
import 'package:get/get.dart';


class FormCarroViewBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FormCarroController>(() => FormCarroController());
    // Get.put<CarroController>(CarroController());
  }
}