import 'package:fl_apirest/models/personajes_model.dart';
import 'package:fl_apirest/network/api_mvc.dart';
import 'package:fl_apirest/views/card_personaje_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiMVC? apiMVC;

  @override
  void initState(){
    super.initState();
    apiMVC=ApiMVC();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: const Center(
          child:  Text('Marvel vs Capcom 2')
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orange],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.5, 0.9],
          ),
        ),
        child: FutureBuilder(
          future: apiMVC!.getAllPersonajes(),
          builder: (BuildContext context,
           AsyncSnapshot <List<PersonajesModel>?>snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Ocurrio un error en la solicitud'),
              );
            } else {
              if (snapshot.connectionState==ConnectionState.done) {
                return _listPersonajes(snapshot.data);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget _listPersonajes(List<PersonajesModel>?personaje){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemBuilder: (context, i){
          PersonajesModel personajes= personaje![i];
          return CardPersonajeView(personajesModel: personajes,);
        },
         separatorBuilder: (_,__)=>const Divider(),
          itemCount: personaje!.length
        ),
    );
  }
}