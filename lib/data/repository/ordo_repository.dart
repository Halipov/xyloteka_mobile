import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/ordo.dart';

class OrdoRepository implements IHttpRepository<Ordo> {
  @override
  Future<Ordo> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/ordo?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Ordo>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/ordo'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Ordo> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Ordo model) {
    // TODO: implement postModel
  }

  @override
  List<Ordo> responseFromJson(String str) =>
      List<Ordo>.from(json.decode(str).map((x) => Ordo.fromMap(x)));
}
