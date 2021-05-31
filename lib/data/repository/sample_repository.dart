import 'dart:convert';

import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/sample.dart';
import 'package:http/http.dart' as http;

class SampleRepository implements IHttpRepository<Sample> {
  @override
  Future<List<Sample>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/samples'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<Sample> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/samples?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Sample> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  List<Sample> responseFromJson(String str) =>
      List<Sample>.from(json.decode(str).map((x) => Sample.fromMap(x)));

  @override
  void postModel(Sample model) async {
    print(model.toJson());
    await http.post(
      Uri.parse('${HttpConsts.url}/api/sample'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: model.toJson(),
    );
  }
}
