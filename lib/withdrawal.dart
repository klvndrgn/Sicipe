import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WithdrawScreen extends StatelessWidget {
  const WithdrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tarik Saldo',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/bca.png'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Text('XXXX XXXX XXXX',
                                style: (GoogleFonts.jost(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25))),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Jumlah Saldo',
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
              'Rp.XXX XXXX',
              style: GoogleFonts.jost(
                  color: Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Penarikan Saldo Minimal Rp10.000',
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 143, 141, 141)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Isi Jumlah Penarikan',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 15, fontFamily: ''),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Tarik Saldo',
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
