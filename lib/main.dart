import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'GESTION DES ÉLECTIONS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List <BottomNavigationBarItem> _item = [];
  int _id = 0;
  String _value = "";
  void electionList() {
    setState(() {

    });
  }

  void addElection() {
    setState(() {

    });
  }
  @override
  void initState(){
    super.initState();
    _item = [];
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.add), label: "Créer une élection"));
    _item.add(const BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste des élections"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _item,
        currentIndex: _id,
        onTap : (int item){
          setState(){
            _id = item;
            _value = "clic sur ${_id.toString()}";
          }
        } ,

      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
