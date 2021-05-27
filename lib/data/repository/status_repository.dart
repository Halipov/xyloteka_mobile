import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/status.dart';

class StatusRepository implements IHttpRepository<Status> {
  @override
  Future<Status> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/status?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Status>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/status'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Status> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Status model) async {
    final response = await http.post(
      Uri.parse('${HttpConsts.url}/api/photo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: model.toJson(),
    );
    if (response.statusCode == 200) {
      print('success');
    }
  }

  @override
  List<Status> responseFromJson(String str) =>
      List<Status>.from(json.decode(str).map((x) => Status.fromMap(x)));
}
