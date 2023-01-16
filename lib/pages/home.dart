import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  List<String> todoList = [];
  String _userToDo = "";

  void setList() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list', todoList);
  }
  void updateToDoList() async {
    var prefs = await SharedPreferences.getInstance();
    //todoList = prefs.getStringList('list') ?? todoList;
     if(prefs.getStringList('list') == null){
      todoList == todoList;
    }else{
      setState(() {
        todoList = prefs.getStringList('list') ?? todoList;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateToDoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("to do list"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(todoList[index]),
              child: Card(
                child: ListTile(
                  title: Text(todoList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.grey[800],
                    onPressed: () {
                      setState(() {
                        todoList.removeAt(index);
                      });
                      setList();
                    },
                  ),
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
                setList();
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (BuildContext bContext){
            return AlertDialog(
              title: Text('new case'),
              content: TextField(
                onChanged: (String value){
                  _userToDo = value;
                },
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      if(!_userToDo.isEmpty){
                        setState(() {
                          todoList.add(_userToDo);
                        });
                        setList();
                      }
                      _userToDo = "";
                      Navigator.of(context).pop();
                    },
                    child: Text('add'))
              ],
            );
          });
        },
        backgroundColor: Colors.amber,
        child: Icon(
          Icons.add_circle,
          color: Colors.grey[800],
          size: 50,
        ),
      ),
    );
  }
}