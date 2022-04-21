import 'dart:convert';
import 'package:fl_apirest/models/personajes_model.dart';
import 'package:http/http.dart' as http;
class ApiMVC {
  // ignore: non_constant_identifier_names
  var URL= Uri.parse(
    'https://secure-hamlet-19722.herokuapp.com/api/v1/characters'
  );

  Future<List<PersonajesModel>?>getAllPersonajes() async{
    var response= await http.get(URL);
    if (response.statusCode==200) {
      var personajes=jsonDecode(response.body) as List;
      return personajes.map((personaje) => PersonajesModel.fromMap(personaje)).toList();
    } else {
      return null;
    }
  }
  
}