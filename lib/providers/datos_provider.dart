import 'package:flutter/cupertino.dart';
import 'package:pruebas_app/models/data_response.dart';
import 'package:pruebas_app/providers/services/data_services.dart';

class DatosProvider extends ChangeNotifier{
List<CryptosSdc> cript =[];
List<CryptosSdc> cript2 =[];

DatosProvider(){
  print(' getCriptos inicializado');
  getCriptos();
}


 Future<List<CryptosSdc>> get()async{
    print("llega al provider");
    final jsonData =  DataService();
    cript = await jsonData.get();
    print(cript);
    
    return cript;

  }

  getCriptos()async{
 final jsonData =  DataService();
    cript2 = await jsonData.get();

    print('cript2 $cript2');
    notifyListeners();

  }



}
