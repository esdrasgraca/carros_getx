import 'package:carros_getx/shared/controllers/usuario_controller.dart';
import 'package:carros_getx/views/login/login_controller.dart';
import 'package:carros_getx/views/splashScreen/splash_controller.dart';
import 'package:get/get.dart';

class SplashViewBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.lazyPut(() => null)
    // Get.put<LoginController>(LoginController(), permanent: true);
    // Get.put<LoginController>(LoginController());
    // Get.put<UsuarioController>(UsuarioController(), permanent: true);
    Get.lazyPut<UsuarioController>(() => UsuarioController() );
    Get.lazyPut<SplashController>(() => SplashController() );
  }
}