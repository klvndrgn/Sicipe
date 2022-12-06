import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class transaksi extends StatefulWidget {
  const transaksi({super.key});

  @override
  State<transaksi> createState() => _transaksiState();
}

class _transaksiState extends State<transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaksi',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
