import '../config/config.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

getPerson() async {
  var uri = 'http://' + Config.IP + ":" + Config.PORT + '/?action=getPerson';

  try {
    Response response = await Dio().get(uri);
    var json = jsonDecode(response.data);
    return json['items'] as List;
  } catch (e) {
    print(e);
  }
}
