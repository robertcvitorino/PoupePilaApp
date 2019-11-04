import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/Pesquisa/pesquisa-bloc.dart';

class PesquisaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs:[Bloc((i)=>PesquisaBloc(context))],     
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.white.withOpacity(0.5),
            ),
             _PesquisaContent(),
          ],
        ),
      ),
    );
}
}
class _PesquisaContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    

    return Container(       
    );
  }
  }
