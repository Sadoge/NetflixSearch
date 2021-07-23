import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  dynamic get(String path, {Map<String, dynamic>? parameters}) async {
    final params = _buildParameters(parameters);

    final response = await _client.get(
      Uri.parse('${ApiConstants.BASE_URL}$path$params'),
      headers: {
        'Content-Type': 'application-json',
        'x-rapidapi-key': ApiConstants.apiKey ?? '',
        'x-rapidapi-host': 'unogsng.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

String _buildParameters(Map<String, dynamic>? parameters) {
  if (parameters != null) {
    final stringBuffer = StringBuffer();
    final keys = parameters.keys.toList();

    for (var i = 0; i < keys.length; i++) {
      final key = keys[i];
      if (i > 0) {
        stringBuffer.write("&");
      } else {
        stringBuffer.write("?");
      }
      stringBuffer.write("$key=${parameters[key]}");
    }

    return stringBuffer.toString();
  }

  return "";
}
