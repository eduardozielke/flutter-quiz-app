import 'dart:convert';

import 'package:flutter_quiz_app/models/api_response.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://the-trivia-api.com/api';

class BaseApi {
  Future<APIResponse> get(String api) async {
    Uri url = Uri.parse(baseUrl + api);
    var response = await http.get(
      url,
    );

    if (response.statusCode == 200) {
      return APIResponse(
        data: response.body,
      );
    }
    return APIResponse(
      error: true,
      errorMessage: 'An error ocurred',
    );
  }

  Future<APIResponse> post(String api, payload) async {
    Uri url = Uri.parse(baseUrl + api);
    var jsonPayload = json.encode(payload);
    var response = await http.post(
      url,
      body: jsonPayload,
    );

    if (response.statusCode < 300) {
      return APIResponse(
        data: response.body,
      );
    }

    return APIResponse(
      error: true,
      errorMessage: 'An error ocurred',
    );
  }

  Future<APIResponse> put(String api, payload) async {
    Uri url = Uri.parse(baseUrl + api);
    var jsonPayload = json.encode(payload);
    var response = await http.put(
      url,
      body: jsonPayload,
    );

    if (response.statusCode < 300) {
      return APIResponse(
        error: false,
        errorMessage: 'Successfully updated',
      );
    }
    return APIResponse(
      error: true,
      errorMessage: 'An error ocurred',
    );
  }

  Future<dynamic> delete(String api) async {
    Uri url = Uri.parse(baseUrl + api);
    var response = await http.delete(
      url,
    );

    if (response.statusCode < 300) {
      return APIResponse(data: response.body);
    }

    return APIResponse(
      error: true,
      errorMessage: 'An error ocurred',
    );
  }
}
