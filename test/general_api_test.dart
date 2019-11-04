import 'package:flutter_test/flutter_test.dart';
import 'package:poupe_pila/src/shared/repositories/general-api.dart';

main(){

var api =GeneralApi();

  test('get estabelecimentos',() async{
    var data =await api.getEstabelecimentos();
    expect(data[0]["id"], 1);
});


}