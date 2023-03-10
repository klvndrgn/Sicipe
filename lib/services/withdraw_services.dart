import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class WithdrawServices {
  // static const String API_WITHDRAW = "http://127.0.0.1:8000/api/penarikan-saldo";
  static const String API_WITHDRAW = "http://10.0.2.2:8000/api/penarikan-saldo";
  final timeout = const Duration(seconds: 10);
  final Uri urlWithdraw = Uri.parse(API_WITHDRAW);
 
  final headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<dynamic> withdrawProcess({required String userId, required String saldo}) async {
    final body = jsonEncode({
      'id_pengguna' : userId,
      'jumlah_penarikan' : saldo
    });

    try {
      final response = await http.post(urlWithdraw, headers: headers, body: body).timeout(timeout);

      if (response.statusCode == 200) {
        final responseData = (response.body);
        print("Response : "+responseData);
        return responseData;
      } else {
        print(jsonEncode({'message':'Request failed with status: ${response.body}.'}));
        return;
      }
    } on SocketException catch (e) {
      print('SocketException: $e');
      // close the socket
      SocketException.closed();
    } catch (e) {
      print(jsonEncode({'message':'Koneksi Gagal Terhubung Ke Server : $e'}));
      return;
    }
  }
}