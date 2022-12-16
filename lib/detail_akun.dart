import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/login_page.dart';

class detail_akun extends StatefulWidget {
  const detail_akun({super.key});

  @override
  State<detail_akun> createState() => _detail_akunState();
}

class _detail_akunState extends State<detail_akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Detail Akun',
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
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: Width / 2),
                Image.asset('assets/icons/profilepic.png'),
                // SizedBox(width: 29),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 9.0,
              bottom: 11,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Ubah Foto Profil',
                    style: (GoogleFonts.jost(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 0.4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                child: Text('Nama Pengguna',
                    style: (GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text('Kimberly',
                    style: (GoogleFonts.jost(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                child: Text('Tanggal Lahir',
                    style: (GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text('01 - 04 - 1995',
                    style: (GoogleFonts.jost(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                child: Text('Alamat Email',
                    style: (GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text('kimberly@gmail.com',
                    style: (GoogleFonts.jost(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
                child: Text('Nomor Rekening',
                    style: (GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text('54426191317',
                    style: (GoogleFonts.jost(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.3),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Keluar dari Akun',
                    style: (GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500))),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios,
                          size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                      onPressed: () => {
                            showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                        title: Text('Konfirmasi Keluar',
                                            style: (GoogleFonts.jost(
                                                color: Colors.deepOrange,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500))),
                                        content: Text(
                                            "Anda ingin keluar dari akun ini?",
                                            style: (GoogleFonts.jost(
                                                fontSize: 14))),
                                        actions: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize: Size(113, 37),
                                                    backgroundColor:
                                                        Colors.grey,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Text(
                                                    'Tidak',
                                                    style: GoogleFonts.jost(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    minimumSize: Size(113, 37),
                                                    backgroundColor:
                                                        Colors.deepOrange,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LoginScreen()));
                                                  },
                                                  child: Text(
                                                    'Iya',
                                                    style: GoogleFonts.jost(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]))
                          }),
                )
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 0.4),
        ]),
      ),

      // Navigation
    );
  }
}
