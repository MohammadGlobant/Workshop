import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  late Database database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.north;
  @override
  void initState() {
    super.initState();
    createDB();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(isBottomSheetShown){
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.north;
            });
          }
          else {
            scaffoldKey.currentState?.showBottomSheet((context) => Container(
            width: double.infinity,
            height: 120.0,
            color: Colors.red,
              child: Center(
                child: IconButton(
                  onPressed: () { insertToDB(); },
                  icon: const Icon(Icons.add),
                ),
              ),
          ));
            isBottomSheetShown = true;
            setState(() {
              fabIcon = Icons.south;
            });
          }

      },
        child: Icon(
          fabIcon,
        ),
      ),
    );
  }

  void createDB() async {
    database = await openDatabase(
      'workShop.db',
      version: 2,
      onCreate: (database,version){
        print('on create DB');
        database.execute(
            'CREATE TABLE workshop (id INTEGER PRIMARY KEY, title TEXT, date Text, time TEXT, status TEXT)'
        ).then((value) => {
          print('table created'),
        }).catchError((error){
          print('error ${error.tostring}');
        });
      },
      onOpen: (database){
        print('on open DB');
      }
    );
  }

  void insertToDB(){
    database.transaction((txn) async {
      txn.rawInsert('INSERT INTO workshop(title, date, time, status) VALUES("first task", "02222", "891", "new")').then((value){
        print('$value inserted successfully');
      }).catchError((error){
        print('the error $error');
      });
    });
  }
}
