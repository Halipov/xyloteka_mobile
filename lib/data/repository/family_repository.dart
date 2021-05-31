import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/family.dart';

class FamilyRepository implements IHttpRepository<Family> {
  @override
  Future<Family> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/family?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Family>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/family'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Family> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Family model) {
    // TODO: implement postModel
  }

  @override
  List<Family> responseFromJson(String str) =>
      List<Family>.from(json.decode(str).map((x) => Family.fromMap(x)));
}
