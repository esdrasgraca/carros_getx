
import 'package:carros_getx/shared/models/carro_model.dart';
import 'package:carros_getx/shared/repositories/carros_repository.dart';
import 'package:carros_getx/utils/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormCarroController extends GetxController {
  final Rx<CarroModel> carroForm = CarroModel().obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();  

  final tNome = TextEditingController();
  final tDesc = TextEditingController();
  final tTipo = TextEditingController();

  final RxInt radioIndex = 0.obs;

  final RxBool showProgress = false.obs;

  // setUser(bool value) {
  //     _showProgress.value = value;         
  //  }
  //  get showProgress {
  //    return _showProgress.value;  
    
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    carroForm.value = Get.arguments;

    if (carroForm != null) {
      tNome.text = carroForm.value.nome;
      tDesc.text = carroForm.value.descricao;
      radioIndex.value = getTipoInt(carroForm.value);
    }

  }

  String validateNome(String value) {
    if (value.isEmpty) {
      return 'Informe o nome do carro.';
    }
    return null;
  }  

  String validateDescricao(String value) {
    if (value.isEmpty) {
      return 'Informe a descrição do carro.';
    }
    return null;
  } 

  void onClickTipo(int value) {    
      radioIndex.value = value;    
  }

  String _getTipo() {
    switch (radioIndex.value) {
      case 0:
        return "classicos";
      case 1:
        return "esportivos";
      default:
        return "luxo";
    }
  }

  getTipoInt(CarroModel carro) {
    switch (carro.tipo) {
      case "classicos":
        return 0;
      case "esportivos":
        return 1;
      default:
        return 2;
    }
  }

  Future salvarCarro(CarroModel carro) async {
    if (!formKey.currentState.validate()) {
      return;
    }

    var c = carro ?? CarroModel();

    c.nome = tNome.text; 
    c.descricao = tDesc.text;
    c.tipo = _getTipo();

    showProgress.value = true;
    ApiResponse response = await CarrosRepository.save(
      c, 
      // c.id
      // carro.id,
      // tNome.text, 
      // tDesc.text,
      // _getTipo()
    );
    showProgress.value = false;

    if (response.ok){
      carroForm.value = c;
      Get.back();
      // Get.toNamed('/carros/detalhes/', arguments: carroForm);
      Get.snackbar(
        "Atenção", 
        "Carro Salvo com Sucesso",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        );

    }else {
      Get.snackbar(
        "Atenção", 
        response.msg,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        );
    }

  }


}