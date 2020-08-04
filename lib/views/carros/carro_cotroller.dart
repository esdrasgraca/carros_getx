import 'dart:convert';

import 'package:carros_getx/shared/models/carro_model.dart';
import 'package:carros_getx/shared/repositories/carros_repository.dart';
import 'package:carros_getx/utils/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarroController extends GetxController {
  final RxList<CarroModel> carroList = <CarroModel>[].obs;
  final Rx<TipoCarro> tipoCarro = Rx<TipoCarro>();
  final RxString erroList = ''.obs;


  // final Rx<TiposCarros> tiposCarros = Rx<TiposCarros>();
  // Rx<TiposCarros> tiposCarros = TiposCarros.classicos.obs;
  // final RxString tipoCarro = ''.obs;
  
    TabController tabController;

    
  // @override
  // onInit() async{
  //  await getCarros(TipoCarro.classicos);
  // }

//   @override
//  void onReady(){
//     ever(tipoCarro, getCarros(tipoCarro.value.));
//   }


  getCarros(String tipo) async {
    carroList.value = null;
    var response = await CarrosRepository.getCarros(tipo);

    // Map mapResponse = json.decode(response);
    if (response.ok) {
      carroList.value = response.result;
    } else {
      Get.snackbar(        
        "Atenção", 
        response.msg,
        backgroundColor: Colors.red,
        colorText: Colors.white
        );
     return erroList.value = response.msg;
    }


    // return carroList.map<CarroModel>((map) => CarroModel.fromMap(response)).toList();
  }
}

// enum TiposCarros { classicos, espostivos, luxo }