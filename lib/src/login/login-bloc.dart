import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:poupe_pila/src/finalCreated/finalCreated-widget.dart';
import 'package:poupe_pila/src/home/home-widget.dart';
import 'package:poupe_pila/src/services/authentication/Authentication.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';

class LoginBloc extends BlocBase {


  final BehaviorSubject<String> _emailController =  BehaviorSubject<String>();
  Observable<String> get emailUser=> _emailController.stream;
  Sink<String> get emailEvent =>_emailController.sink;
  final BehaviorSubject<String> _senhaController = new BehaviorSubject<String>();
  Observable<String> get senhaUser=> _senhaController.stream;
  Sink<String> get senhaEvent =>_senhaController.sink;


  var _controllerLoading = BehaviorSubject<bool>(seedValue: true);
  Stream<bool> get outLoading => _controllerLoading.stream;

  final _authentication = new Authentication();

  final BuildContext context;
  LoginBloc(this.context);
 

  
  onGoogle(){    
    Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => FinalCreated()));
  }

  checkLogin()async {
    FirebaseUser usuarioAutenciticado = await FirebaseAuth.instance.currentUser();
    if(usuarioAutenciticado!=null){
    Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeWidget()));
    }else{
      _controllerLoading.add(false);
    }
  }
  onClickLogin()async{
    _controllerLoading.add(true);
    await _authentication.singEmailAndPassword(_emailController?.value, _senhaController?.value);
    FirebaseUser usuarioAutenciticado = await FirebaseAuth.instance.currentUser();
    if(usuarioAutenciticado!=null){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeWidget()));
    }else{
      _controllerLoading.add(false);
    }
  }


  // Deve ser feito um bloc para Home page e adicionar esse metodo 
  logout() async{
    _authentication.signOut();
  }





  @override
  void dispose() {
    _controllerLoading.close();
  }
}
