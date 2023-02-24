import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_app/model/app_model.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';
  Future<List<AppModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response response = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        return list.map((e) => AppModel.fromJson(e)).toList();
      } else {
        return <AppModel>[];
      }
    } catch (e) {
      return <AppModel>[];
    }
  }
}
