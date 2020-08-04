import 'dart:convert' as convert;
import 'dart:io';

import 'package:carros_getx/shared/models/carro_model.dart';
import 'package:carros_getx/utils/api_response.dart';
import 'package:carros_getx/views/carros/carro_cotroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarrosRepository {
  List<CarroModel> list = [];

  static Future<ApiResponse<List<CarroModel>>> getCarros(String tipo) async {
    try {
        var url =
            'https://carros-springboot.herokuapp.com/api/v1/carros/tipo/$tipo';

        print("GET > $url");

        var response = await http.get(url);

        // Map mapResponse = json.decode(response.body);

        String json = response.body;

        List list = convert.json.decode(json);

        List<CarroModel> carros = list.map<CarroModel>((map) => CarroModel.fromMap(map)).toList();

        return ApiResponse.ok(result: carros);
    // return response.body;
  } catch(error, exception) {
      print("Erro Ao buscar Carro $error > $exception");

      return ApiResponse.error(msg:"Não foi possível buscar os carros.");
    }
  }
  static Future<ApiResponse> save(CarroModel c) async {
  // static Future<ApiResponse> save(CarroModel c, File file) async {
    try {

      // if(file != null) {
      //   ApiResponse<String> response = await UploadApi.upload(file);
      //   if(response.ok) {
      //     String urlFoto = response.result;
      //     c.urlFoto = urlFoto;
      //   }
      // }

      var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/';
      if (c.id != null) {
        url += "${c.id}";
      }

      print("POST > $url");

      String json = c.toJson();

      Map<String,String> headers = {
        "Content-Type": "application/json"
      };

      print("   JSON > $json");

      var response = await  (c.id == null
           ? http.post(url, body: json, headers: headers)
           : http.put(url, body: json, headers: headers));
      //  http.post(url, body: json, headers: headers);
      // (c.id == null
      //     ? http.post(url, body: json, headers: headers)
      //     : http.put(url, body: json, headers: headers));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map mapResponse = convert.json.decode(response.body);

        CarroModel carro = CarroModel.fromMap(mapResponse);

        print("Novo carro: ${carro.id}");

        return ApiResponse.ok();
      }

      if (response.body == null || response.body.isEmpty) {
        return ApiResponse.error(msg:"Não foi possível salvar o carro");
      }

      Map mapResponse = convert.json.decode(response.body);
      return ApiResponse.error(msg:mapResponse["error"]);
    } catch (e) {
      print(e);

      return ApiResponse.error(msg:"Não foi possível salvar o carro");
    }
  }

  // static Future<ApiResponse> delete(Carro c) async {
  //   try {

  //     var url = 'https://carros-springboot.herokuapp.com/api/v1/carros/${c.id}';

  //     print("DELETE > $url");

  //     var response = await http.delete(url);

  //     print('Response status: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       return ApiResponse.ok();
  //     }

  //     return ApiResponse.error(msg:"Não foi possível deletar o carro");
  //   } catch (e) {
  //     print(e);

  //     return ApiResponse.error(msg:"Não foi possível deletar o carro");
  //   }
  // }
}
