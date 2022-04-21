import 'package:fl_apirest/models/personajes_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardPersonajeView extends StatelessWidget {
   
  CardPersonajeView({Key? key, this.personajesModel}) : super(key: key);
  PersonajesModel? personajesModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow:const [
            BoxShadow(
                color: Colors.amber,
                offset: Offset(0.0, 5.0),
                blurRadius: 0)
          ]),
          child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('${personajesModel!.name}'),
                      Text('${personajesModel!.universe}'),
                      IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                        )),
                    ],
                  ),
                ),
                FadeInImage(
                  placeholder:const AssetImage('assets/loading-23.gif'),
                  image: NetworkImage(
                    '${personajesModel!.headShot}'
                  ),
                  fadeInDuration:const Duration(milliseconds: 500),
                ),
              ],
            //),
          ),
    );
  }
}