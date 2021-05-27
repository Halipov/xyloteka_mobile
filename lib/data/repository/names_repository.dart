import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/names.dart';

class NamesRepository implements IHttpRepository<Names> {
  @override
  Future<Names> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/sample?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Names>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/samples'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Names> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Names model) {
    // TODO: implement postModel
  }

  @override
  List<Names> responseFromJson(String str) =>
      List<Names>.from(json.decode(str).map((x) => Names.fromMap(x)));
}
