import 'package:http/http.dart' as http;

abstract class HTTPProtocol {
  Future<http.Response> getRequest(Uri url);
  Future<http.Response> postRequest(Uri url, Map<String, dynamic> params);
}

class HTTPClient implements HTTPProtocol {
  String get baseURL => "http://api.mathjs.org/v4/";
  static HTTPClient sharedInstance = HTTPClient._();

  HTTPClient._();

  @override
  Future<http.Response> getRequest(Uri url) async {
    try {
      var response = await http.get(url);
      return response;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<http.Response> postRequest(Uri url, Map<String, dynamic> params) async {
    try {
      var response = await http.post(url, body: params);
      return response;
    } catch (e) {
      return null;
    }
  }
}