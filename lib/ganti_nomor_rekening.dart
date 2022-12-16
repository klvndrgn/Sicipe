import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/bottom_navigation.dart';
import 'package:sicipe/detail_akun.dart';
import 'package:sicipe/profile_saya.dart';
import 'package:sicipe/register_page.dart';
// <<<<<<< Updated upstream
import 'package:sicipe/forget_password.dart';
// =======
import 'package:sicipe/home_page.dart';
// import 'package:sicipe/search.dart';
// >>>>>>> Stashed changes

class ganti_nomor_rekeningScreen extends StatefulWidget {
  const ganti_nomor_rekeningScreen({super.key});
  @override
  State<ganti_nomor_rekeningScreen> createState() => _ganti_nomor_rekeningState();
}

class _ganti_nomor_rekeningState extends State<ganti_nomor_rekeningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text('Ganti Nomor Rekening',
                style: GoogleFonts.jost(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
            automaticallyImplyLeading: true,
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                // Image.asset('assets/icons/gambar_tambah_resep.png'),
                // SizedBox(
                //   height: 10,
                // ),
                Text(
                  'Masukkan Data Nomor Rekening Baru',
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                // Username Field
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, left: 22),
                  child: Row(
                    children: [
                      Text(
                        'Nomor Rekening Baru',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 143, 141, 141)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nomor Rekening Baru',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 22,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Nama Pemilik Rekening Baru',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(color: Color.fromARGB(255, 143, 141, 141)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan Nomor Rekening Baru',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),

                // Password Field

                // Button Masuk

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profile_saya()));
                      },
                      child: Text(
                        'Konfirmasi',
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),

                // Footer
              ],
            ),
          ),
        ));
  }
}
