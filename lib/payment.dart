import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
body: String dropdownValue;
 var singleChildScrollView = SingleChildScrollView(
        child: Column(children: [
          Text(
            'Nomor Rekening Virtual',
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
            'XXXX XXXX XXXX XXXX',
            style: GoogleFonts.jost(
              fontSize: 28,
              color: Colors.deepOrange,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                child: Text(
                  'Salin Nomor',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
          SizedBox(height: 3, width: 400),
          Text(
            'Proses verifikasi tidak lebih dari 10 menit setelah pembayaran berhasil',
            style: GoogleFonts.jost(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Petunjuk melakukan pembayaran :',
            style: GoogleFonts.jost(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
            textAlign: TextAlign.left,
          ), onPressed: () {  },
// Step 1.
String dropdownValue = 'mBanking BCA';
// Step 2.
DropdownButton<String>(
  // Step 3.
  value: dropdownValue,
  // Step 4.
  items: <String>['Masuk ke aplikasi m-BCA',
'1.Pilih m-Transfer -> BCA Virtual Account',
'2.Masukkan nomor Virtual Account XXXXXXXXXXXX',
'3.Masukkan jumlah yang ingin di top up',
'4.Periksa informasi yang tertera sudah sesuai dengan data kamu',
'5.Input pin BCA dan pilih OK']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 14.5),
      ),
    );
  }).toList(),
  // Step 5.
  onChanged: (String? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  },
),
String dropdownValue = 'iBanking BCA';
// Step 2.
DropdownButton<String>(
  // Step 3.
  value: dropdownValue,
  // Step 4.
  items: <String>['Masuk ke aplikasi m-BCA',
'1.Masuk ke aplikasi m-BCA',
'2.Pilih Transfer Dana -> BCA Virtual Account',
'3.Masukkan nomor Virtual Account XXXXXXXXXXXX',
'4.Masukkan jumlah yang ingin di top up',
'5.Periksa informasi yang tertera sudah sesuai dengan data kamu'
'6.Input pin BCA dan pilih OK']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 14.5),
      ),
    );
  }).toList(),
  // Step 5.
  onChanged: (String? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  },
),
String dropdownValue = 'ATM BCA';
// Step 2.
DropdownButton<String>(
  // Step 3.
  value: dropdownValue,
  // Step 4.
  items: <String>['Masuk ke aplikasi m-BCA',
'1.Masukkan kartu ke ATM dan inputkan pin BCA.',
'2.Pilih Transaksi Lainnya -> Transfer -> BCA Virtual Account',
'3.Masukkan nomor Virtual Account XXXXXXXXXXXX',
'4.Masukkan jumlah yang ingin di top up',
'5.Periksa informasi yang tertera sudah sesuai dengan data kamu'
'6.Input pin BCA dan pilih OK']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(
        value,
        style: TextStyle(fontSize: 14.5),
      ),
    );
  }).toList(),
  // Step 5.
  onChanged: (String? newValue) {
    setState(() {
      dropdownValue = newValue!;
    });
  },
),
              ),
            ),
          ),
        ]),
      );
  }
}
