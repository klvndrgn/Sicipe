import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/login_page.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
    );
// ignore: dead_code
body: var singleChildScrollView = SingleChildScrollView(
        child: Column(children: [
          Text(
            'Jumlah Saldo',
            style: GoogleFonts.jost(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3),
          Text(
            'Nama Akun : XXXX',
            style: GoogleFonts.jost(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3),
          Text(
            'RpXX.XXX.XXXX',
            style: GoogleFonts.jost(
              fontSize: 28,
              color: Colors.deepOrange,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3),
          Text(
            'Penarikan Saldo Minimal Rp 10.000',
            style: GoogleFonts.jost(
              fontSize: 16,
            
            ),
            textAlign: TextAlign.center
            ,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Color.fromARGB(255, 137, 137, 137)
                ),
                child: Text(
                  'Isi Jumlah Penarikan Saldo',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                child: Text(
                  'Tarik Saldo',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                
              ),
            ),
          ),
        ]),
      );
  }
}
