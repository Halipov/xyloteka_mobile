import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/species.dart';

class SpeciesRepository implements IHttpRepository<Species> {
  @override
  Future<Species> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/sample?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Species>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/samples'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Species> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Species model) async {
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
  List<Species> responseFromJson(String str) =>
      List<Species>.from(json.decode(str).map((x) => Species.fromMap(x)));
}
