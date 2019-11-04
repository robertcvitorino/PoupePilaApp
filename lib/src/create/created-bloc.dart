import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/home/home-widget.dart';
import 'package:poupe_pila/src/services/authentication/Authentication.dart';
import 'package:rxdart/rxdart.dart';

 class CreatedBLoc extends BlocBase{

   final _authentication = new  Authentication();

   final BehaviorSubject<String> _emailController =  BehaviorSubject<String>();
  Observable<String> get emailUser=> _emailController.stream;
  Sink<String> get emailEvent =>_emailController.sink;

  final BehaviorSubject<String> _senhaController = new BehaviorSubject<String>();
  Observable<String> get senhaUser=> _senhaController.stream;
  Sink<String> get senhaEvent =>_senhaController.sink;

  var _controllerLoading = BehaviorSubject<bool>(seedValue: true);
  Stream<bool> get outLoading => _controllerLoading.stream;

   final BuildContext context;
   CreatedBLoc(this.context);

    onClickCreatedConta() async {
    _controllerLoading.add(true);
    print("Usuario bloc"+_emailController.value);
    print("Usuario bloc"+_senhaController.value);
    if (await _authentication.createdEmailAndPassword(_emailController?.value, _senhaController?.value)) {
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