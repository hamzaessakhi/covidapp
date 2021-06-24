
import 'dart:convert';
import 'package:http/http.dart';

class Brain {
  String URl = 'https://coronavirus-19-api.herokuapp.com/countries/Morocco';

  Future<dynamic> getData() async {
    Response data = await get(URl);
    if (data.statusCode == 200) {
      return jsonDecode(data.body);
    }  else{
      print(data.statusCode);
    }
  }
}
