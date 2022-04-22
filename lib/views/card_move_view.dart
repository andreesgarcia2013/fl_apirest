import 'package:fl_apirest/models/moves_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardMoveView extends StatelessWidget {
  CardMoveView({Key? key, this.movesModel}) : super(key: key);
  MovesModel? movesModel;
  
  @override
  Widget build(BuildContext context) {
    String imagen=movesModel!.image.toString();
    var ruta='assets$imagen';
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text('${movesModel!.moveName}'),
            ),
             FadeInImage(
             placeholder: const AssetImage('assets/loading-23.gif'),
             image: AssetImage(ruta),
             fadeInDuration: const Duration(milliseconds: 500),
           ),
          ],
        ),
      ),
    );
  }
}