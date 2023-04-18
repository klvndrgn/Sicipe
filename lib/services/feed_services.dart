import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sicipe/model/globals.dart';

class FeedServices{
  static const String API_FEED = baseURL + 'feed';
  static const String API_RESEP = baseURL + 'resep';

  final Uri urlFeed = Uri.parse(API_FEED);
  final Uri urlResep = Uri.parse(API_RESEP);

  final timeout = const Duration(seconds: 10);

  Future<dynamic> fetchFeed({required int page}) async {
    try {
        final response = await http.get(urlFeed, headers: headers);
        print("Response : "+response.body);
        return response;
    } on SocketException catch (e) {
      print('SocketException: $e');
      // close the socket
      SocketException.closed();
    } catch (e) {
      print(jsonEncode({'message':'Koneksi Gagal Terhubung Ke Server : $e'}));

      return e;
    }
  }

  Future<dynamic> fetchDropdownResep() async {
    try {
        final response = await http.get(urlResep, headers: headers);
        print("Response : "+response.body);
        return response;
    } on SocketException catch (e) {
      print('SocketException: $e');
      // close the socket
      SocketException.closed();
    } catch (e) {
      print(jsonEncode({'message':'Koneksi Gagal Terhubung Ke Server : $e'}));
      return e;
    }
  }

  Future<dynamic> postFeed({required final data}) async {
    try {
        final response = await http.post(urlFeed, headers: headers, body: jsonEncode(data));
        print("Response : "+response.body);
        return response;
    } on SocketException catch (e) {
      print('SocketException: $e');
      // close the socket
      SocketException.closed();
    } catch (e) {
      print(jsonEncode({'message':'Koneksi Gagal Terhubung Ke Server : $e'}));
      return e;
    }
  }

  Future<dynamic> deleteFeed({required int id}) async {
    try {
        final response = await http.delete(Uri.parse(API_FEED + '/$id'), headers: headers);
        print("Response : "+response.body);
        return response;
    } on SocketException catch (e) {
      print('SocketException: $e');
      // close the socket
      SocketException.closed();
    } catch (e) {
      print(jsonEncode({'message':'Koneksi Gagal Terhubung Ke Server : $e'}));
      return e;
    }
  }

  Future<dynamic> updateFeed({required int id, required final data}) async {
    try {
        final response = await http.patch(Uri.parse(API_FEED + '/$id'), headers: headers, body: jsonEncode(data));
        print("Response : "+response.body);
        return response;
    } on SocketException catch (e) {
      print('SocketException: $e');
      // close the socket
      SocketException.closed();
    } catch (e) {
      print(jsonEncode({'message':'Koneksi Gagal Terhubung Ke Server : $e'}));
      return e;
    }
  }
  
}