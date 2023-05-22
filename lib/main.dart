import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:TaskListScreen() ,
      home: Home_screen(),
    );
  }
}

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _data = TextEditingController();

  void clearText() {
    _name.clear();
    _data.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(hintText: 'Name'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white38),
                child: TextField(
                  controller: _data,
                  decoration: InputDecoration(hintText: 'message'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Map<String, dynamic> note = {
                      "name": _name.text,
                      "data": _data.text
                    };
                    final docUser =
                    FirebaseFirestore.instance.collection('messages').add(note);
                    clearText();
                  },
                  child: Text('Enter')),
            ],
          ),
        ),
      ),
    );
  }
}