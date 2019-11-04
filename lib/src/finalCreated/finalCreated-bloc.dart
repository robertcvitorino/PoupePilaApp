import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/home/home-widget.dart';
import 'package:poupe_pila/src/services/authentication/Authentication.dart';
import 'package:rxdart/rxdart.dart';

class FinalCreatedBloc extends BlocBase{

  final BuildContext context;
   FinalCreatedBloc(this.context);
    final _authentication = new Authentication();
    
  var _controllerLoading = BehaviorSubject<bool>(seedValue: true);
  Stream<bool> get outLoading => _controllerLoading.stream;


  onClickGoogle() async {
    _controllerLoading.add(true);
    if (await _authentication.signWithGoogle()) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeWidget()));
    } else {
      _controllerLoading.add(false);
    }
  }

  

  @override
  void dispose() {
   _controllerLoading.close();
  }

}