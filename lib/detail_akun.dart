import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/bottom_navigation.dart';
import 'package:sicipe/login_page.dart';
import 'package:sicipe/profile_saya.dart';

class detail_akun extends StatefulWidget {
  const detail_akun({super.key});

  @override
  State<detail_akun> createState() => _detail_akunState();
}

class _detail_akunState extends State<detail_akun> {
  @override
  Widget build(BuildContext context) {
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Detail Akun',
              style: GoogleFonts.jost(color: Colors.white, fontSize: 20)),
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
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(width: Width / 2),
              Image.asset('assets/icons/gambar_tambah_resep.png'),
              // SizedBox(width: 29),
            ],
          ),
          SizedBox(height: 9),
          Row(
            children: [
              SizedBox(width: 155),
              Text('Ubah Foto Profil',
                  style: (GoogleFonts.jost(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500))),
            ],
          ),
          SizedBox(height: 11),
          Divider(color: Colors.grey, thickness: 0.25),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Text('Nama Pengguna',
                      style: (GoogleFonts.jost(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  children: [
                    Text('Kimberly',
                        style: (GoogleFonts.jost(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(color: Colors.grey, thickness: 0.3),
          SizedBox(height: 15),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Tanggal Lahir',
                          style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 223),
              Column(
                children: [
                  Row(
                    children: [
                      Text('01 - 04 - 1995',
                          style: (GoogleFonts.jost(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(color: Colors.grey, thickness: 0.3),
          SizedBox(height: 15),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Alamat Email',
                          style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 190),
              Column(
                children: [
                  Row(
                    children: [
                      Text('kimberly@gmail.com',
                          style: (GoogleFonts.jost(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(color: Colors.grey, thickness: 0.4),
          SizedBox(height: 15),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('Nomor Rekening',
                          style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 203),
              Column(
                children: [
                  Row(
                    children: [
                      Text('54426191317',
                          style: (GoogleFonts.jost(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(color: Colors.grey, thickness: 0.2),
          Row(
            children: [
              SizedBox(width: 20),
              Text('Keluar dari Akun',
                  style: (GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w500))),
              SizedBox(width: 250),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.3),
        ]),
      ),

      // Navigation
    );
  }
}
