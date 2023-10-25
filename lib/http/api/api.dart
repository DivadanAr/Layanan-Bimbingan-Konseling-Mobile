import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  postRequest({
    required String route,
    required Map<String, String> data,
  }) async {
    const String apiUrl =
        'https://layanan.bimbingan.konseling.secondiary.com/api';

    String url = apiUrl + route;

    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      headers: _header(),
    );
  }

  _header() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
