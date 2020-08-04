import 'package:carros_getx/shared/controllers/usuario_controller.dart';
import 'package:carros_getx/shared/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DrawerList extends GetView<UsuarioController> {
  UsuarioModel usuario;

  @override
  Widget build(BuildContext context) {
    // HomeController controller = Modular.get();

    // Future<Usuario> future = Usuario.get();
    // Future<Usuario> future = auth.getUser();
    // Future<Usuario> user = auth.getUser();
    // user.then((resp){
    //    usuario  = resp;
    // });

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[

            GetX<UsuarioController>(
              builder: (_) {
                if (controller.user == null) {
                 return Container();            
                }else {
                 return UserAccountsDrawerHeader(
                    accountName: Text(controller.user.nome), 
                    accountEmail: Text(controller.user.email),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(controller.user.urlFoto),
                    ),
                  );
                }
              },
            ),

            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(),
            )
          ],
        ),
      ),
    );
  }

  _onClickLogout() async {
    await controller.logout();
    Get.offAllNamed("/Login");
  }
}
