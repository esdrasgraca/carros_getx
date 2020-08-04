import 'package:carros_getx/shared/controllers/usuario_controller.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  UsuarioController usuarioController = Get.find(); 

  @override
  void onInit() async {
    // TODO: implement onInit
    
    await usuarioController.getUser().then((usuarioController.setUser));

    loadLogin();

    super.onInit();            
  }

 loadLogin() {
  //  Future.delayed(Duration(seconds: 5)).then((value){
    if ((usuarioController.user != null)  || (usuarioController.user == '')) {
                   Get.toNamed('/carros');
                } else /* if (usuarioController.user == false)*/ {
                   Get.toNamed('/Login');
                }
  //  }
  //  );
  }
}