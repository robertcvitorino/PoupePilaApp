
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/Carrinho/carrinho-widget.dart';
import 'package:poupe_pila/src/Conta/conta-widget.dart';
import 'package:poupe_pila/src/Favorito/favorito-widget.dart';
import 'package:poupe_pila/src/Pesquisa/pesquisa-widget.dart';
import 'package:poupe_pila/src/home/home-bloc.dart';


class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        blocs:[Bloc((i)=>HomeBloc(context))],     
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.white.withOpacity(0.5),
            ),
             _HomeContent(),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatefulWidget {
  @override
  __HomeContentState createState() => __HomeContentState();
}

class __HomeContentState extends State<_HomeContent> {
   HomeBloc bloc=BlocProvider.getBloc<HomeBloc>();
  int _indiceAtual=0;
  @override
  Widget build(BuildContext context) {
    List<Widget> telas =[
      PesquisaWidget(),
      FavoritoWidget(),
      CarrinhoWidget()
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text('Poupe Pila'),
        backgroundColor: Colors.green,
        actions: <Widget>[

          IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContaWidget()),
                );
           }
          ),

        ],
        iconTheme: IconThemeData(
          color: Colors.white,
          opacity: 0.5,
        ),
        automaticallyImplyLeading: false,
      ),




      body: Material(       
        child: telas[_indiceAtual]
      ),





      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual=indice;
          });
        },
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              title: Text('Pesquisa'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.search)
            ),
            BottomNavigationBarItem(
                title: Text('Favorito'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.star_border)
            ),
            BottomNavigationBarItem(
                title: Text('Carrinho'),
                backgroundColor: Colors.green,
                icon: Icon(Icons.shopping_cart)
            ),
          ]

      ),
    );
  }
}




