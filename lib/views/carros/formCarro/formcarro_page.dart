import 'package:carros_getx/utils/widgets/app_button.dart';
import 'package:carros_getx/utils/widgets/app_text.dart';
import 'package:carros_getx/views/carros/formCarro/formCarro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class FormcarroPage extends StatefulWidget {
//   final String title;
//   final Carro carro;
//   const FormcarroPage({this.carro, Key key, this.title = "Formcarro"})
//       : super(key: key);

//   @override
//   _FormcarroPageState createState() => _FormcarroPageState();
// }

class FormcarroView extends GetView<FormCarroController> {
  // Carro get carro => widget.carro;
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.carroForm != null ? controller.carroForm.value.nome : "Novo Carro",
        ),
      ),
      body: Container(child: _form()),
    );
  }

  _form() {
    return Form(
      key: controller.formKey,
      child: ListView(
        children: <Widget>[
          // _headerFoto(),
          Text(
            "Clique na imagem para tirar uma foto",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          Divider(),
          Text(
            "Tipo",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          Obx(() => _radioTipo()),
          Divider(),
          AppText(
            "Nome",
            "",
            controller: controller.tNome,
            keyboardType: TextInputType.text,
            validator: controller.validateNome,
          ),
          AppText(
            "Descrição",
            "",
            controller: controller.tDesc,
            keyboardType: TextInputType.text,
            validator: controller.validateDescricao,
          ),
          AppButton(
            "Salvar",
            onPressed: () async {
              await controller.salvarCarro(controller.carroForm.value);
              
            },
            showProgress: controller.showProgress.value,
          )
        ],
      ),
    );
  }
  

  _radioTipo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: 0,
          groupValue: controller.radioIndex.value,
          onChanged: controller.onClickTipo,
        ),
        Text(
          "Clássicos",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
        Radio(
          value: 1,
          groupValue: controller.radioIndex.value,
          onChanged: controller.onClickTipo,
        ),
        Text(
          "Esportivos",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
        Radio(
          value: 2,
          groupValue: controller.radioIndex.value,
          onChanged: controller.onClickTipo,
        ),
        Text(
          "Luxo",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
      ],
    );
  }
}
