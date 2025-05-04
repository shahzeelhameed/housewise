abstract class BaseApiServices {
  Future<dynamic> postApi(String endpoint, var data);
  Future<dynamic> getApi(String endpoint);
}
