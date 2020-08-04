import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros_getx/shared/models/carro_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../carro_cotroller.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage> {
  CarroController carroController = Get.find();
  // final TiposCarros tipo;
  // // Obx(Obx)
  // CarrosPage(this.tipo);

  String get tipo => widget.tipo;

  @override
  void initState() {
    super.initState();
    // GetX<CarroController>(
    //   builder: (_) {
    carroController.getCarros(tipo);
    //   },
    // );

    // controller.getCarros(tipo);

    // // Escutando uma stream
    // final bus = EventBus.get(context);
    // subscription = bus.stream.listen((Event e){
    //   print("Event $e");
    //   CarroEvent carroEvent = e;
    //   if(carroEvent.tipo == tipo) {
    //     _bloc.fetch(tipo);
    //   }
    // });
  }

  Widget build(BuildContext context) {
    // return Obx(
    //   () =>

    return Obx(
      () => carroController.carroList.value == null ? Center(child: CircularProgressIndicator()) 
      : RefreshIndicator(onRefresh: _onRefresh, child: CarrosListView())
        // : Center(child: Text(carroController.erroList.value))      
      );
      

    
      
    // });
    //   // if (controller.listCarros.error != null) {
    //   //   return Center(child: Text(controller.listCarros.error.message));
    //   // }

    //   // if (controller.carroList.value == null) {
    //   //   return Center(child: CircularProgressIndicator());
    //   // }

    // return RefreshIndicator(onRefresh: _onRefresh, child: CarrosListView());
    // builder: (CarroController) {
    //  return RefreshIndicator(
    //     onRefresh: _onRefresh,
    //     child: CarrosListView(),
    //   );
    // },
    // );
  }

  Future<void> _onRefresh() {
    // GetX<CarroController>(
    //   builder: (_) {
    return carroController.getCarros(tipo);
    //   },
    // );
    // return controller.getCarros(tipo);
  }

  CarrosListView() {
    // List<Carro> list = controller.listCarros.value;
    return Obx(      
    () => 
    carroController.carroList.isEmpty ? Center( child: Text("Nenhum Carro do Tipo $tipo Encontrado")) : 
       Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: carroController.carroList.length,
            itemBuilder: (_, index) {
              CarroModel carro = carroController.carroList[index];
              return Card(
                color: Colors.grey[100],
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: CachedNetworkImage(
                          imageUrl: carro.urlFoto ??
                              "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
                          width: 250,
                        ),
                      ),
                      Text(
                        carro.nome,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        "descrição...",
                        style: TextStyle(fontSize: 16),
                      ),
                      ButtonBarTheme(
                        data: ButtonBarThemeData(),
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('DETALHES'),
                              onPressed: () {
                                 Get.toNamed('/carros/detalhes/', arguments: carro);
                              },
                            ),
                            FlatButton(
                              child: const Text('SHARE'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  // _onClickCarro(BuildContext context, carro) {
  //   // Modular.to.pushNamed('/detalheCarro/$carro');
  //   Modular.to.pushNamed('/detalheCarro', arguments: carro);
  // }
}
