import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top Up',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [Image.asset('assets/icons/bca.png')],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text('Biaya Admin Rp. 1000',
                              style: (GoogleFonts.jost(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nomor Rekening Virtual',
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Nama Akun: XXX',
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'XXXX XXXX XXXX',
              style: GoogleFonts.jost(
                  color: Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {},
                  child: Text(
                    'Salin Nomor',
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Proses verifikasi tidak lebih dari 10 menit setelah pembayaran berhasil',
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
