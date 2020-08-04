import 'package:carros_getx/shared/controllers/usuario_controller.dart';
import 'package:carros_getx/shared/models/usuario_model.dart';
import 'package:carros_getx/shared/repositories/login_repository.dart';
import 'package:carros_getx/utils/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  UsuarioController usuarioController = Get.find(); 

    final formKey = GlobalKey<FormState>();
  
  final tLogin = TextEditingController();

  final tSenha = TextEditingController();

  // final Rx<UsuarioModel> user = UsuarioModel().obs;

  final focusSenha = FocusNode();  

  final RxBool isLoading = false.obs;

  Future login() async {
      isLoading.value = true;
      ApiResponse response = await usuarioController.login(tLogin.text, tSenha.text);
      isLoading.value = false;
      if (response.ok) {
        
        Get.offAllNamed('/carros');
      } else {
        Get.snackbar(          
          "Atenção",           
          response.msg,
          backgroundColor: Colors.red,
          colorText: Colors.white
        );
      }
  }

}