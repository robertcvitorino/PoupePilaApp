import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

class Authentication  {

   final _firebase =FirebaseAuth.instance;
    final _google = new GoogleSignIn();


  Future<bool> createdEmailAndPassword(String email,String senha)async{
      print("email authetication"+email);
      print("email authetication"+ senha);

      final usuarioCadastrado = await _firebase.createUserWithEmailAndPassword(email: email,password: senha).then((firebaseUser){
        print("novo ususario criando "+ firebaseUser.email);
      }).catchError((error){
        print("Aconteceu erro" + error.toString());
      });
      return usuarioCadastrado!=null;

  }Future<bool> singEmailAndPassword(String email,String senha)async{
      print("email authetication"+email);
      print("email authetication"+ senha);

      final usuarioCadastrado = await _firebase.signInWithEmailAndPassword(email: email,password: senha).then((firebaseUser){
        print("usuario logado "+ firebaseUser.email);
      }).catchError((error){
        print("Aconteceu erro" + error.toString());
      });
      return usuarioCadastrado!=null;

  }

  Future<bool> signWithGoogle() async {

    final googleAuthentication = await _google.signIn();

    final authenticated = await googleAuthentication.authentication;

    final usuarioAutenticado = await _firebase.signInWithGoogle(
        idToken: authenticated?.idToken,
        accessToken: authenticated?.accessToken);
    
    print(usuarioAutenticado.email);
    print(usuarioAutenticado.displayName);    
      

    return usuarioAutenticado.uid != null;
  }
 
  
  void signOut()async{
    await _firebase.signOut();
  }

}
