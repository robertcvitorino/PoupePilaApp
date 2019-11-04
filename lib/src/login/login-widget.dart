import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:poupe_pila/src/login/login-bloc.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      bloc: LoginBloc(context),
      child: Material(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.white.withOpacity(0.5),
            ),
            SingleChildScrollView(child: _LoginContent(),) 
          ],
        ),
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    bloc.checkLogin();
    _button() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton.icon(
              color: Colors.green,
              textColor: Colors.white,
              onPressed: bloc.onGoogle,
              icon: Icon(FontAwesomeIcons.google),
              label: Text("  Google   ")),
          Container(
            width: 15,
          ),
        ],
      );
    }
    

    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(35, 50, 35, 25),
          child: Container(
            height: 150,
            width: 100,
            child: Image.asset("assets/logo-poupe.png"),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(35, 20, 35, 20),
          child: Text(
            "Poupe Pila",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                fontFamily: 'Quicksand'),
          ),
        ),
       Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.green,
                    width: 0.5,
                    style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Padding(
                  padding:
                      EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                  child: Icon(
                    Icons.alternate_email,
                    color: Colors.green,
                  ),
                ),
                new Expanded(
                  child: TextField(  
                    onChanged: bloc.emailEvent.add,                                 
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: Colors.green, width: 0.5, style: BorderStyle.solid),
            ),
          ),
          padding: const EdgeInsets.only(left: 0.0, right: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 00.0),
                child: Icon(
                  Icons.lock_open,
                  color: Colors.green,
                ),
              ),
              new Expanded(
                child: TextField(
                  onChanged: bloc.senhaEvent.add,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '*********',
                    hintStyle: TextStyle(color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 5),
                    color: Colors.transparent,
                    onPressed: () => {},
                    child: Text(
                      "Recuperar Senha",
                      style: TextStyle(color: Colors.green,fontSize: 10),
                    ),
                  ),
                ),
                Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 5),
                    color: Colors.transparent,
                    onPressed: (){},
                    child: Text(
                      "Criar Conta",
                      style: TextStyle(color: Colors.green,fontSize: 10),
                    ),
                  ),
                )
              ],
            ),
          ),      
        Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left:70, right: 70, top: 10,bottom: 20),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20.0),
                    color: Colors.green,
                    onPressed: bloc.onClickLogin,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        StreamBuilder(
            initialData: false,
            stream: bloc.outLoading,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return AnimatedCrossFade(
                  firstChild: _button(),
                  secondChild: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(),
                  ),
                  crossFadeState: snapshot.data
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 500));
            })
      ],
    );
  }
}
