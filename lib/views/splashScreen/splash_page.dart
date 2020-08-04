
import 'package:carros_getx/shared/controllers/usuario_controller.dart';
import 'package:carros_getx/views/splashScreen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class SplashPage extends StatefulWidget {
//   SplashPage({Key key}) : super(key: key);

//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

class SplashPage extends StatelessWidget {
  final UsuarioController usuarioController = Get.put(UsuarioController(),permanent: true);
  final SplashController splashController = Get.put(SplashController());
  
// @override
// void initState() {
//     // TODO: implement initState
//     super.initState();
//       // final usuario = Get.find<UsuarioController>();
//       // UsuarioController usuarioController = Get.find(); 
//       //         //  Future.delayed(Duration(seconds: 2)).then((value){
//       //           if (usuarioController.isLoged.value == true) {
//       //             Get.toNamed('/carros');
//       //           } else if (usuarioController.isLoged.value == false) {
//       //             Get.toNamed('/Login');
//       //           }

//         }
      
        @override
        Widget build(BuildContext context) {
          return Container(
              child: Scaffold(
               body: Center(
                 child: CircularProgressIndicator()                    
                  ,)
             ),);
          // GetX<SplashController>(
          //   builder: (_){
          //    return Container(
          //     child: Scaffold(
          //      body: Center(
          //        child: CircularProgressIndicator(),)
          //    ),
          // );
          //   },
          // );
        }
      }
      
