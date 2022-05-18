abstract class IClientHttp {
  void add(String token);
  Future<Map<String, dynamic>> get(String url);
}
