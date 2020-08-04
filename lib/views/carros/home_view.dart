import 'package:carros_getx/shared/repositories/carros_repository.dart';
import 'package:carros_getx/utils/widgets/drawer_list.dart';
import 'package:carros_getx/views/carros/carro_cotroller.dart';
import 'package:carros_getx/views/carros/widget/carros_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class HomeView extends GetView<CarroController>  {  
  // void initState() { 
  //   super.initState();
  //   _initTabs();
  // }



  // _initTabs() async {
  //   // int index = await Prefs.getInt("tabIdx");

  //   _tabController = TabController(length: 4, vsync: this);
  //   setState(() {
  //     _tabController.index = controller.indexTab;
  //   });

    // _tabController.addListener(() {
    //   Prefs.setInt("tabIdx", _tabController.index);
    // });
  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
          child: Scaffold(
        appBar: AppBar(
          title: Text("Home View"),
          bottom: TabBar(
            // controller: controller.tabController,
            tabs: [
              Tab(
                      text: "Clássicos",
                      icon: Icon(Icons.directions_car),
                    ),                  
                    Tab(
                      text: "Esportivos",
                      icon: Icon(Icons.directions_car),

                    ),
                    Tab(
                      text: "Luxo",
                      icon: Icon(Icons.directions_car),
                    ),
                    Tab(
                      text: "Favoritos",
                      icon: Icon(Icons.favorite),
                    )
          ]),
        ),
        body: TabBarView(

          // controller: controller.tabController,
          children: [
            // Obx(
            //   () => CarrosPage(controller.tipoCarro.value = "classicos"),
            // ),
            // Obx(
            //   () => CarrosPage(controller.tipoCarro.value = "esportivos"),
            // ),
            // Obx(
            //   () => CarrosPage(controller.tipoCarro.value = "luxo"),
            // ),
            
            // CarrosPage(controller.tipoCarro.value.classicos),
          CarrosPage(TipoCarro.classicos),
            CarrosPage(TipoCarro.esportivos),
            CarrosPage(TipoCarro.luxo),
            // Container(color: Colors.green,),
            // Container(color: Colors.green,),
            // Container(color: Colors.green,),
            Container(color: Colors.green,)
          ]),
        drawer: DrawerList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _onClickAdicionarCarro,
        ),
      ),
    );
  }
   void _onClickAdicionarCarro() {
    // push(context, CarroFormPage());
  }

}