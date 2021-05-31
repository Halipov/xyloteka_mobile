import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xyloteka/consts/http_consts.dart';
import 'package:xyloteka/data/interface/IHttpRepository.dart';
import 'package:xyloteka/data/models/photo.dart';

class PhotoRepository implements IHttpRepository<Photo> {
  @override
  Future<Photo> fetchModel(int id) async {
    final response =
        await http.get(Uri.parse('${HttpConsts.url}/api/sample?id=$id'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes)).first;
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<Photo>> fetchModelList() async {
    final response = await http.get(Uri.parse('${HttpConsts.url}/api/samples'));
    if (response.statusCode == 200) {
      return responseFromJson(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  String modelToJson(List<Photo> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  @override
  void postModel(Photo model) async {
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
  List<Photo> responseFromJson(String str) =>
      List<Photo>.from(json.decode(str).map((x) => Photo.fromMap(x)));

  // Future<void> loadPhoto(File file) async {
  //   var dio = Dio();
  //   FormData formData = FormData.fromMap({
  //     "name": "wendux",
  //     "file1": UploadFileInfo(new File("./upload.jpg"), 'upload1.jpg')
  //   });
  //   response = await dio.post("/info", data: formData);
  // }
}
