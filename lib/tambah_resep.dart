import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/bottom_navigation.dart';
import 'package:sicipe/register_page.dart';
import 'package:sicipe/forget_password.dart';
import 'package:sicipe/login_page.dart';

class tambah_resep extends StatefulWidget {
  const tambah_resep({super.key});
  @override
  State<tambah_resep> createState() => _tambah_resepState();
}

class _tambah_resepState extends State<tambah_resep> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text('Penambahan Resep',
                style: GoogleFonts.jost(color: Colors.white, fontSize: 20)),
            automaticallyImplyLeading: true,
            leading: IconButton(
              color: Colors.white,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            )),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/icons/gambar_tambah_resep.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Tambahkan Foto Makanan',
                  style: GoogleFonts.jost(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),

                // Username Field
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Kategori Makanan',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Pilih Kategori',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Jumlah Kalori (Kal)',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Diisi dengan angka',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Durasi Masak (Menit))',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Diisi dengan angka',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Deskripsi Makanan',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Kurang dari 25 kata',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Bahan',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Ditulis dengan urutan bullet',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Alat',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Ditulis dengan urutan bullet',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 22),
                    Text(
                      'Langkah - Langkah',
                      style:
                          GoogleFonts.jost(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                            hintText: 'Ditulis dengan urutan bullet',
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'MASUK',
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
