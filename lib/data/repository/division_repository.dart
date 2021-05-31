import 'dart:convert';

import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/division.dart';
import 'package:http/http.dart' as http;

class DivisionRepository implements IHttpRepository<Division> {
  @override
  Future<Division> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/division?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Division>> fetchModelList() async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/division'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Division> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Division model) {
    // TODO: implement postModel
  }

  @override
  List<Division> responseFromJson(String str) =>
      List<Division>.from(json.decode(str).map((x) => Division.fromMap(x)));
}
