

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Request {
  
  Future<Response> post(final uri, String accessToken, body) async {
    final response = http.post(
      Uri.parse(uri),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json', 
        'Authorization': 'Bearer $accessToken',
      },
      body: json.encode(body),
    );
    return response;
  }

}