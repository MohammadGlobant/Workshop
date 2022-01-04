import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:workshop/home_pages/listItems.dart';

class explore extends StatefulWidget {
  const explore({Key? key}) : super(key: key);

  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> {
  late Database database;
  List<Map> tasks = [] ;

  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
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
        backgroundColor: Colors.red,
        onPressed: () {
          if(isBottomSheetShown)
          {
            Navigator.pop(context);
            isBottomSheetShown = false;
            setState(() {
              fabIcon = Icons.north;
            });
          }
          else {
            scaffoldKey.currentState?.showBottomSheet(
                  (context) => Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 300,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                            labelText: "Title",
                            prefixIcon: Icon(Icons.accessibility_new),
                            border: OutlineInputBorder()
                        ),
                        onFieldSubmitted: (String value){
                          print(value);
                        },
                        validator: (value){
                          if(value!.isEmpty) return 'must not be empty';
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onTap: (){
                          showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value){
                            timeController.text = value!.format(context).toString();
                          });
                        },
                        controller: timeController,
                        keyboardType: TextInputType.datetime,
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                            labelText: "Time",
                            prefixIcon: Icon(Icons.timelapse),
                            border: OutlineInputBorder()
                        ),
                        onFieldSubmitted: (String value){
                          print(value);
                        },
                        validator: (value){
                          if(value!.isEmpty) return 'must not be empty';
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        onTap: (){
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse("2100-01-01"),).
                          then((value){
                            dateController.text = DateFormat.yMMMd().format(value!);
                          });
                        },
                        controller: dateController,
                        keyboardType: TextInputType.datetime,
                        cursorColor: Colors.deepOrange,
                        decoration: const InputDecoration(
                            labelText: "Date",
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder()
                        ),
                        onFieldSubmitted: (String value){
                          print(value);
                        },
                        validator: (value){
                          if(value!.isEmpty) return 'must not be empty';
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        color: Colors.red[700],
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            setState(() {
                              insertToDB(
                                  title: titleController.text,
                                  date: dateController.text,
                                  time: timeController.text
                              ).then((value){
                                Navigator.pop(context);
                                setState(() {
                                  isBottomSheetShown = false;
                                  fabIcon = Icons.north;
                                  tasks = value;
                                });
                              });
                            });
                          }
                          },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ),
          ),
                  elevation: 20,
            ).closed.then((value){
              isBottomSheetShown = false;
              setState(() {
                fabIcon = Icons.north;
              });
            });
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:ListView.separated(
          itemBuilder: (context,index) => listItems(tasks[index]),
          separatorBuilder: (context,index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: tasks.length
        ),
      ),
    );
  }

  void createDB() async {
    database = await openDatabase(
      'work_Shop.db',
      version: 1,
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
        getDataFromDatabase(database).then((value){
          setState(() {
            tasks = value;
          });
        });
        print('on open DB');
      }
    );
  }

  Future insertToDB({
    required String title,
    required String time,
    required String date
  }) async {
    return await database.transaction((txn) async {
      txn.rawInsert('INSERT INTO workshop(title, date, time, status) VALUES("$title", "$date", "$time", "new")').
      then((value){

        print('$value inserted successfully');
      }).catchError((error){
        print('the error $error');
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async{
     return await database.rawQuery('SELECT * FROM workshop');
  }
}
