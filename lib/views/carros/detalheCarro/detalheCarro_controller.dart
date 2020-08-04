import 'package:carros_getx/shared/models/carro_model.dart';
import 'package:carros_getx/views/carros/formCarro/formCarro_controller.dart';
import 'package:get/get.dart';

class DetalheCarroController extends GetxController {

    // final Rx<CarroModel> carro = Rx<CarroModel>();

    FormCarroController formCarroController = Get.find();



    @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // carro.value = Get.arguments;
    formCarroController.carroForm.value = Get.arguments;
  }

}