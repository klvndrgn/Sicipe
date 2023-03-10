import 'dart:convert';

import 'package:sicipe/model/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(
      String username_pengguna, String alamat_email, String kata_sandi) async {
    Map data = {
      "username_pengguna": username_pengguna,
      "alamat_email": alamat_email,
      "kata_sandi": kata_sandi,
      //"tanggal_lahir": tanggal_lahir,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {"alamat_email": email, "kata_sandi": password};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
