import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



class HomeFBDB extends StatefulWidget {
  const HomeFBDB({Key? key}) : super(key: key);

  @override
  State<HomeFBDB> createState() => _HomeFBDBState();
}

class _HomeFBDBState extends State<HomeFBDB> {
  List<String> todoList = [];
  String _userToDo = "";

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void _menuOpen(){
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context){
          return Scaffold(
            appBar: AppBar(title: Text('Menu'),),
            body: Row(
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                }, child: Text('main')),
                Padding(padding: EdgeInsets.only(left: 15)),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  Navigator.pushNamedAndRemoveUntil(context, '/tododb', (route) => false);
                }, child: Text('firebase page'))
              ],
            ),
          );
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("to do list"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            _menuOpen();
          }, icon: Icon(Icons.menu))
        ],
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData) return Text('has not records');
          return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data?.docs[index].get('item')),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.grey[800],
                        onPressed: () {
                          FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                        },
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    FirebaseFirestore.instance.collection('items').doc(snapshot.data!.docs[index].id).delete();
                  },
                );
              });
        },
      ),
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
                     FirebaseFirestore.instance.collection('items').add({'item': _userToDo});
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


