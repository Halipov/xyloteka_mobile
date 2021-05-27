abstract class IHttpRepository<T> {
  Future<T> fetchModel(int id);
  Future<List<T>> fetchModelList();
  String modelToJson(List<T> data);
  List<T> responseFromJson(String str);
  void postModel(T model);
}
