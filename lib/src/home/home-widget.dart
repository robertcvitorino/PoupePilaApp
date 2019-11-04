
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/login/login-widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  _logout()async{
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context)=>LoginWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Poupe Pila"),),
      body: Container(),
      floatingActionButton: FloatingActionButton(onPressed: _logout,child: Icon(Icons.exit_to_app),),


    );
  }
}
