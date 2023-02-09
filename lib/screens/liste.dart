import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Liste extends StatefulWidget{
  const Liste({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ListeScreen();
}

class _ListeScreen extends State<Liste>{
  List liste = [];

    var test =  List<String>.generate(20, (index) => "Item : $index");



  getAllPolling()async{
    var reponse = await http.get(Uri.parse("http://localhost/API/polling/pollings.php" ));
    print(reponse.statusCode);
    liste = json.decode(reponse.body);

    /*
    for(var i = 0; i < body.length; i++ ){
      liste.add(Element.fromJson(body[i]));
    }
    */



    print("liste = " );
    print(liste);
    return liste;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPolling();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Liste des éléctions"),
      ),
      body : Container(
        child: ListView.builder(
            itemCount: liste.length,
            itemBuilder: (context, index){
          return ListTile(
            leading: Text(liste[index]['nom'].toString()),
            title: Text(liste[index]['domaine']),
            subtitle: Text(liste[index]['description'].toString()),
          );
        }),
      ),
    );
  }
}

