import 'package:carros_getx/utils/widgets/app_button.dart';
import 'package:carros_getx/utils/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  // final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros Getx"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
        key: controller.formKey,
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              AppText(
                "Login",
                "Digite o login",
                controller: controller.tLogin,
                // validator: (s) => _validateLogin(s),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: controller.focusSenha,
              ),
              SizedBox(height: 10),
              AppText(
                "Senha",
                "Digite a senha",
                controller: controller.tSenha,
                password: true,
                // validator: _validateSenha,
                keyboardType: TextInputType.number,
                focusNode: controller.focusSenha,
              ),
              SizedBox(
                height: 20,
              ),
              Obx(
                () =>
                AppButton(
                "Login",
                onPressed: () async {
                  await controller.login();
                },
                showProgress: controller.isLoading.value,
              )
              )
            ],
          ),
        ));
  }

}
