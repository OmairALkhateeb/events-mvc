import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<dynamic> get({required String url}) async {
    String? token = await getToken(); // Retrieve token
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"}, // Pass token in headers
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "There is a problem with the status code ${response.statusCode}");
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    String? token = await getToken(); // Retrieve token
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"}, // Pass token in headers
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "There is a problem with the status code ${response.statusCode} with body ${jsonDecode(response.body)}");
    }
  }

  Future<dynamic> put({required String url, @required dynamic body}) async {
    String? token = await getToken(); // Retrieve token
    http.Response response = await http.put(
      Uri.parse(url),
      headers: {"Authorization": "Bearer $token"}, // Pass token in headers
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "There is a problem with the status code ${response.statusCode}");
    }
  }
}
