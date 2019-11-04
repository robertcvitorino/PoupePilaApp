import 'package:dio/dio.dart';
import 'package:poupe_pila/src/shared/repositories/constants.dart';

class GeneralApi{

  Dio dio=new Dio();
  

  /*GeneralApi(){
    Dio dio= new Dio();
    dio.options.baseUrl = URL_API;
  }*/
  Future getEstabelecimentos()async{
    dio.options.baseUrl = URL_API;
    Response response =await dio.get("/estabelecimentos");
    return response.data;
  }

  
}