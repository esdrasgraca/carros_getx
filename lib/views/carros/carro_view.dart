import 'package:carros_getx/utils/widgets/drawer_list.dart';
import 'package:flutter/material.dart';

class CarroView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),        
      ),
      drawer: DrawerList(),
      body: Container(),
    );
  }
}