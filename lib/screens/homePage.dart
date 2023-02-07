
import 'package:dev_app_mobile/screens/homeView.dart';
import 'package:flutter/material.dart';
import 'liste.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageScreen();

}

class _HomePageScreen extends State<HomePage>{
  final PageController pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  void electionList() {
  }
  void addElection() {
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap : (item){
          _currentIndex = item;
          pageController.jumpToPage(_currentIndex);
        } ,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Créer une élection"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Liste des élections")
        ],
      ),
      body: PageView(
        onPageChanged: (index) {
            _currentIndex = index;
        },
        controller: pageController,
        children : const <Widget>[
          HomeView(),
          Liste()
        ],
      ),
    );
  }
}
