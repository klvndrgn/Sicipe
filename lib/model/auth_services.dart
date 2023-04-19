import 'dart:convert';
import 'dart:io';

import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data = {"alamat_email": email, "kata_sandi": password};
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    var token = json.decode(response.body)["token"];

    await prefs.setString('token', token);

    return response;
  }

  static Future<http.Response> me(String token) async {
    var url = Uri.parse(baseURL + 'user');
    http.Response response = await http.get(
      url,
      headers: {...headers, "Authorization": "Bearer " + token},
    );

    return response;
  }

  static Future<http.Response> editAccount(
    String token,
    String username_pengguna,
    String alamat_email,
    String tanggal_lahir,
    String? photo_profile,
  ) async {
    Map<String, dynamic> data = {
      "username_pengguna": username_pengguna,
      "alamat_email": alamat_email,
      "tanggal_lahir": tanggal_lahir,
      "photo_profile": photo_profile,
    };

    // var map = new Map<String, dynamic>();
    // map['username_pengguna'] = username_pengguna;
    // map['alamat_email'] = alamat_email;
    // map['tanggal_lahir'] = tanggal_lahir;
    // map['photo_profile'] = photo_profile;

    // var body = json.encode(data);
    var url = Uri.parse(baseURL + 'user');
    // http.Response response = await http.post(
    //   url,
    //   headers: {
    //     ...headers,
    //     'content-type': 'multipart/form-data',
    //     "Authorization": "Bearer " + token
    //   },
    //   body: body,
    // );

    // print(response.body);
    // return response;

    jsonToFormData(http.MultipartRequest request, Map<String, dynamic> data) {
      for (var key in data.keys) {
        request.fields[key] = data[key].toString();
      }
      return request;
    }

    try {
      var request = http.MultipartRequest('POST', url);
      request = jsonToFormData(request, data);
      request.headers['X-Requested-With'] = "XMLHttpRequest";
      request.headers['Authorization'] = "Bearer $token";

      if (photo_profile != null) {
        print(photo_profile);
        request.files.add(
            await http.MultipartFile.fromPath("photo_profile", photo_profile));
      }
      http.Response httpResponse =
          await http.Response.fromStream(await request.send());

      return httpResponse;
    } catch (error) {
      print('Error add project $error');
      return throw (error);
    }
  }
}
