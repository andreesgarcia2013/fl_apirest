import 'package:fl_apirest/screens/moves_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
    '/moves':(BuildContext context) => const MovesScreen()
  };
}