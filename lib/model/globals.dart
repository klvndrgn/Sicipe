import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String serverBaseURL = "http://10.0.2.2:8000"; //emulator localhost
const String baseURL = serverBaseURL + "/api/"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
