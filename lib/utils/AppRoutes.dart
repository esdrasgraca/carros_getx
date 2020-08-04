

import 'package:carros_getx/views/carros/carro_view.dart';
import 'package:carros_getx/views/carros/carro_view_biding.dart';
import 'package:carros_getx/views/carros/detalheCarro/detalheCarro_view.dart';
import 'package:carros_getx/views/carros/detalheCarro/detalheCarro_view_biding.dart';
import 'package:carros_getx/views/carros/formCarro/carro_view_biding.dart';
import 'package:carros_getx/views/carros/formCarro/formcarro_page.dart';
import 'package:carros_getx/views/carros/home_view.dart';
import 'package:carros_getx/views/login/login_view.dart';
import 'package:carros_getx/views/login/login_view_binding.dart';
import 'package:carros_getx/views/splashScreen/splash_page.dart';
import 'package:carros_getx/views/splashScreen/splash_view_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
      binding: SplashViewBinding(),
    ),
    GetPage(
      name: '/Login',
      page: () => LoginView(),
      binding: LoginViewBinding(),
    ),
    GetPage(
      name: '/carros',
      page: () => HomeView(), //(uncomment here to swith to todo app)TodoList(),
      binding: CarroViewBinding(),
    ),
    GetPage(
      // parameter: ,
      name: '/carros/detalhes/' ,
      page: () => DetalheCarroView(), //(uncomment here to swith to todo app)TodoList(),
      binding: CarroViewBinding(),
    ),
    GetPage(
      // parameter: ,
      name: '/carros/formsCarros/' ,
      page: () => FormcarroView(), //(uncomment here to swith to todo app)TodoList(),
      binding: CarroViewBinding(),
    ),
  ];
}