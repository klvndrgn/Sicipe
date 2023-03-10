import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class PaymentServices {
  // static const String API_TOPUP = "http://127.0.0.1:8000/api/top-up";
  static const String API_TOPUP = "http://10.0.2.2:8000/api/top-up";
  final timeout = const Duration(seconds: 10);
  final Uri urlTopUp = Uri.parse(API_TOPUP);
 
  final headers = <String, String>{
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  Future<dynamic> paymentProcess({required String userId, required String saldo}) async {
    final body = jsonEncode({
      'id_pengguna' : userId,
      'jumlah_top_up' : saldo
    });

    try {
      final response = await http.post(urlTopUp, headers: headers, body: body).timeout(timeout);

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