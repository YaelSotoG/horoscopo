import 'dart:convert';

import 'package:horoscopo/models/astros_model.dart';
import 'package:http/http.dart' as http;

class AstrosProvider {
  String _url = 'api.xor.cl';

  Future<Astros> getAstros() async {
    final url =
        Uri.https(_url, '/tyaas/'); //configura la llamada a la base de datos
    final resp = await http.get(url); //llama a la base de datos
    final decodeddata = json
        .decode(resp.body); //todo el string que llega lo convierte en un mapa
    final dia = new Astros.fromMap(decodeddata);
    // // print(dia.url);
    return dia;
  }
}
