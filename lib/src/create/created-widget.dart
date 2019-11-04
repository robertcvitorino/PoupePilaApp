import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:poupe_pila/src/create/created-bloc.dart';

class CreatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreatedBLoc>(
      bloc: CreatedBLoc(context),
      child: Container(
          color: Colors.green.withOpacity(0.5), child: _CreatedContent()),
    );
  }
}

class _CreatedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CreatedBLoc bloc = BlocProvider.of<CreatedBLoc>(context);

    _button() {
      return Container(
          width: MediaQuery.of(context).size.width,
          margin:
              const EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 20),
          alignment: Alignment.center,
          child: new Row(children: <Widget>[
            new Expanded(
              child: new FlatButton(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                color: Colors.green,
                onPressed: bloc.onClickCreatedConta,
                child: Text(
                  "Criar conta",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ]));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Poupe Pila"),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin:
              const EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Usuario',
                        prefixIcon: Icon(Icons.person_outline),
                        labelStyle: TextStyle(fontSize: 15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    onChanged: bloc.emailEvent.add,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.mail_outline),
                        labelStyle: TextStyle(fontSize: 15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    onChanged: bloc.senhaEvent.add,
                    obscureText: true,
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Senha',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Confirma senha',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Bairro',
                        prefixIcon: Icon(Icons.gps_fixed),
                        labelStyle: TextStyle(fontSize: 15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Cidade',
                        prefixIcon: Icon(Icons.location_city),
                        labelStyle: TextStyle(fontSize: 15))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: TextFormField(
                    style: TextStyle(
                      color: Colors.green,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25)),
                        labelText: 'Idade',
                        prefixIcon: Icon(Icons.account_circle),
                        labelStyle: TextStyle(fontSize: 15))),
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
          ),
        ),
      ),
    );
  }
}
