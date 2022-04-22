import 'package:fl_apirest/models/moves_model.dart';
import 'package:fl_apirest/network/api_moves.dart';
import 'package:fl_apirest/views/card_move_view.dart';
import 'package:flutter/material.dart';

class MovesScreen extends StatefulWidget {
  const MovesScreen({Key? key}) : super(key: key);

  @override
  State<MovesScreen> createState() => _MovesScreenState();
}

class _MovesScreenState extends State<MovesScreen> {
   ApiMoves? apiMoves;

  @override
  void initState(){
    super.initState();
    apiMoves=ApiMoves();
  }
  @override
  Widget build(BuildContext context) {
    final personaje = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(personaje['name']),
          backgroundColor: Colors.indigo,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red, Colors.amber],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage: NetworkImage(personaje['head']),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    personaje['name'],
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    personaje['universe'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: apiMoves!.getMoves(personaje['name'].toString()),
                builder: (BuildContext context,
                    AsyncSnapshot<List<MovesModel>?> snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Ocurrio un error en la solicitud'),
                    );
                  } else {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _listMoves(snapshot.data);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
            )
          ],
        ));
  }

  // Widget _listMoves(List<MovesModel>?move){
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: ListView.separated(
  //       itemBuilder: (context, i){
  //         MovesModel moves= move![i];
  //         return CardMoveView(movesModel: moves,);
  //       },
  //        separatorBuilder: (_,__)=>const Divider(),
  //         itemCount: move!.length
  //       ),
  //   );
  // }

  Widget _listMoves(List<MovesModel>? moves) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        //shrinkWrap: true,
        scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            MovesModel move = moves![index];
            return CardMoveView(movesModel: move);
          },
          separatorBuilder: (_, __) => const Divider(
                height: 10,
              ),
          itemCount: moves!.length),
    );
  }
}
