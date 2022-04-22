import 'dart:convert';
import 'package:fl_apirest/models/moves_model.dart';
import 'package:http/http.dart' as http;

class ApiMoves {
  Future<List<MovesModel>?>getMoves(String personaje) async{
    // ignore: non_constant_identifier_names
    var URL= Uri.parse(
    'https://secure-hamlet-19722.herokuapp.com/api/v1/characters/$personaje/moves'
    );
    var response= await http.get(URL);
    if (response.statusCode==200) {
      var moves=jsonDecode(response.body) as List;
      return moves.map((move)=>MovesModel.fromMap(move)).toList();
    } else {
      return null;
    }
  }
}