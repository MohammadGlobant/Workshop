import 'package:flutter/material.dart';

class AppButtonBar extends StatefulWidget {
  const AppButtonBar({Key? key}) : super(key: key);
  @override
  _AppButtonBarState createState() => _AppButtonBarState();
}

class _AppButtonBarState extends State<AppButtonBar> {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      fixedColor: Colors.red,
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

    );
  }
}
