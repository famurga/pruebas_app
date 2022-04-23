import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pruebas_app/models/data_response.dart';

class DataService {
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiI3YmEzZmViMS1iMzZiLTRmOWMtODY1ZS1jMTJiNGY2ODNjZGEiLCJlbWFpbCI6Ijk3ODBkZXNhcnJvbGxhZG9yMTNAZ21haWwuY29tIiwidWlkIjoiMmRhZjVmMTctY2VlNi00OGQ5LThiNjMtOTkxNWE4ZTFlMjM0IiwiaWRfdXN1YXJpbyI6IjJkYWY1ZjE3LWNlZTYtNDhkOS04YjYzLTk5MTVhOGUxZTIzNCIsImlkX2NvbWVyY2lvIjoiYjlmNTE3YzYtOWYwOC00ZmRkLWJkYzAtYmM4NjhhMWQ0MTJmIiwiaWRfbW9uZWRhX2RpZ2l0YWwiOiIiLCJpZF9iaWxsZXRlcmFfZGlnaXRhbCI6IiIsImlkX21vbmVkYV9maXNpY2EiOiIiLCJpZF9iaWxsZXRlcmFfZmlzaWNhIjoiIiwiZGF0b3NfY29tZXJjaW8iOiJjb21lcmNpbyBnb256YWxvIiwibm9tYnJlcyI6ImNvbWVyY2lvIGdvbnphbG8iLCJhcGVsbGlkb3MiOiItIiwidGlwb19kb2N1bWVudG8iOiJSVUMiLCJucm9fZG9jdW1lbnRvIjoiMTIzNDU2Nzg5MDEiLCJpcCI6IjE3OS42LjE2NS4xOCIsIm5iZiI6MTY1MDI0MTk3NSwiZXhwIjoxNjUxNDQxOTc1LCJpc3MiOiJCaXRjb2luLkFwaSIsImF1ZCI6IkJpdGNvaW4uQXBpLlVzZXIifQ.jmfSPUc5mL7Pc7xSn7BU-iirwNaYO5wkH76YsLofNhI';
  
  List<CryptosSdc> criptos = [];
  get() async {
    return await http.get(
        Uri.parse('http://161.97.162.17:91/api/TipoMoneda/GetAllDataCripto'),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          'pEstado': 'true',
        }).then((http.Response response) {
      try {
     
        final jsonData = json.decode(response.body);
        
        for(var  crip in jsonData['data']['cryptosSdc']){
                criptos.add(CryptosSdc.fromMap(crip));
          
        }
                
        return criptos;
      } catch (e) {
        print(e);
      }
    });
  }
}
