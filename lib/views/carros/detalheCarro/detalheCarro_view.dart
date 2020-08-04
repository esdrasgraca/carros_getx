import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros_getx/shared/models/carro_model.dart';
import 'package:carros_getx/views/carros/detalheCarro/detalheCarro_controller.dart';
import 'package:carros_getx/views/carros/widget/text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../carro_cotroller.dart';
// import 'detalhecarro_controller.dart';

// class DetalheCarroPage extends StatefulWidget {
//   final Carro carro;
//   final String title;

//   // DetalheCarroPage(this.carro);

//   const DetalheCarroPage({this.carro, Key key, this.title = "DetalheCarro"})
//       : super(key: key);

//   @override
//   _DetalheCarroPageState createState() => _DetalheCarroPageState();
// }

class DetalheCarroView extends GetView<DetalheCarroController> {
  
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.formCarroController.carroForm.value.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _onClickMapa,
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: _onClickVideo,
          ),
          PopupMenuButton<String>(
            onSelected: _onClickPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: "Editar",
                  child: Text("Editar"),
                ),
                PopupMenuItem(
                  value: "Deletar",
                  child: Text("Deletar"),
                ),
                PopupMenuItem(
                  value: "Share",
                  child: Text("Share"),
                )
              ];
            },
          )
        ],
      ),
      body: Obx(() =>  _body(),)
    );
  }

  _onClickMapa() {}

  _onClickVideo() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        Get.toNamed('/carros/formsCarros/', arguments: controller.formCarroController.carroForm.value);
        // push(context, CarroFormPage(carro: carro));
        break;
      case "Deletar":
        // deletar();
        break;
      case "Share":
        print("Share !!!");
        break;
    }
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          CachedNetworkImage(
              imageUrl: controller.formCarroController.carroForm.value.urlFoto ??
                  "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png"),
          _bloco1(),
          Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

                  Obx(() => text(controller.formCarroController.carroForm.value.nome, fontSize: 20, bold: true),),

                  // Obx(() => Text(carro.nome)),   teste         
              
              text(controller.formCarroController.carroForm.value.tipo, fontSize: 16)
            ],
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 40,
              ),
              onPressed: _onClickFavorito,
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                size: 40,
              ),
              onPressed: _onClickShare,
            )
          ],
        )
      ],
    );
  }

  _bloco2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        text(controller.formCarroController.carroForm.value.descricao, fontSize: 16, bold: true),
        SizedBox(
          height: 20,
        ),
        // Observer(
        //   builder: (BuildContext context) {
        //     if (controller.lorim.value == null) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }

        //     return text(controller.lorim.value, fontSize: 16);
        //   },
        // ),
      ],
    );
  }

  _onClickFavorito() {}

  _onClickShare() {}
}
