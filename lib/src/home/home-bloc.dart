import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/Carrinho/carrinho-widget.dart';
import 'package:poupe_pila/src/Conta/conta-widget.dart';
import 'package:poupe_pila/src/Favorito/favorito-widget.dart';
import 'package:poupe_pila/src/Pesquisa/pesquisa-widget.dart';
import 'package:poupe_pila/src/login/login-widget.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase{
  

  final BuildContext context;
  HomeBloc(this.context);

  

   final BehaviorSubject<Int> _indiceController =  BehaviorSubject<Int>();
  Observable<Int> get indicelTela=> _indiceController.stream;
    Sink<Int> get indiceEvent => _indiceController.sink;

    final BehaviorSubject<Int> _indiceAtualController =  BehaviorSubject<Int>();
  Observable<Int> get indicelAtual=> _indiceAtualController.stream;
    Sink<Int> get indiceAtualEvent => _indiceAtualController.sink;



  navegacaoTelas(Int indice){    
    _indiceController.add(_indiceAtualController.value);
    
    return _indiceController;

  }
  
  /*
  onClickBottonConta(){
    Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => ContaWidget()));
  }*/
  logout()async{
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context)=>LoginWidget()));
    }
  
  
  
  }
  
  class Int {
}