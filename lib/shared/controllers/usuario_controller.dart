import 'package:carros_getx/shared/models/usuario_model.dart';
import 'package:carros_getx/shared/repositories/login_repository.dart';
import 'package:carros_getx/utils/api_response.dart';
import 'package:carros_getx/utils/prefs.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

class UsuarioController extends GetxController {
   final RxBool isLoged = false.obs;
   final Rx<UsuarioModel> _user = Rx<UsuarioModel>();
   setUser(UsuarioModel value) {
      _user.value = value;
      String usuario = convert.json.encode(value);    
      Prefs.setString("user.prefs", usuario);         
   }
   get user {
     return _user.value;  
    
  }

  loadUser() async {

  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser().then((setUser));
  }



   Future<UsuarioModel> getUser() async{
    if ((user == null) || (user == '')) {
      String json = await Prefs.getString("user.prefs");
     if ((json != "")&&(json != "null")) {
        Map map = convert.json.decode(json);
        UsuarioModel user = UsuarioModel.fromJson(map);      
      return user;
      }      
    }
    return user;
  }

   Future login(String login, String senha) async {
     ApiResponse response = await LoginRepository.login(login, senha);     

        setUser(response.result);

     print("Usuario Controller $user");

     return response;
   }

   Future logout() async{
     Prefs.setString("user.prefs", "");
     setUser(null);
   }
}