import 'package:flutter/material.dart';
import 'package:workshop/home_pages/explore.dart';
import 'package:workshop/home_pages/home.dart';
import 'package:workshop/home_pages/profile.dart';
import 'package:workshop/home_pages/tag.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> pages = [
    const home(),
    const explore(),
    const tag(),
    const profile()
  ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.red[800]),
        title: const Center(child: Icon(Icons.terrain,size: 50.0,)),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(30),
          alignment: Alignment.bottomLeft,
          child:const Icon(
            Icons.terrain,color: Colors.white,size: 40,
          ),
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar:  BottomNavigationBar(
        fixedColor: Colors.red,
        currentIndex: currentIndex,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.turned_in_not),
            label: 'Tag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],

      ),
    );
  }

}