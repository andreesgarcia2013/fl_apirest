import 'package:fl_apirest/models/personajes_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardPersonajeView extends StatelessWidget {
  CardPersonajeView({Key? key, this.personajesModel}) : super(key: key);
  PersonajesModel? personajesModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      color: Colors.amber,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text('${personajesModel!.name}'),
                Text('${personajesModel!.universe}'),
              ],
            ),
          ),
          FadeInImage(
            width: 95.0,
            placeholder: const AssetImage('assets/loading-23.gif'),
            image: NetworkImage('${personajesModel!.headShot}'),
            fadeInDuration: const Duration(milliseconds: 500),
          ),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/moves', arguments: {
                  'name': personajesModel!.name,
                  'head': personajesModel!.headShot,
                  'universe': personajesModel!.universe
                });
              },
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              )),
        ],
        //),
      ),
    );
  }
}
