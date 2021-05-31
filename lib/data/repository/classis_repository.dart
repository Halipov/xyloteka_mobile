import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/classis.dart';

class ClassisRepository implements IHttpRepository<Classis> {
  @override
  Future<Classis> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/classis?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Classis>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/classis'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Classis> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Classis model) {
    // TODO: implement postModel
  }

  @override
  List<Classis> responseFromJson(String str) =>
      List<Classis>.from(json.decode(str).map((x) => Classis.fromMap(x)));
}
