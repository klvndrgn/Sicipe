import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text('Buat Postingan',
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
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, left: 22),
                  child: Row(
                    children: [
                      Text(
                        'Resep Makanan',
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
                            hintText: 'Pilih resep',
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
                        'Deskripsi',
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
                            hintText: 'Tambahkan deskripsi postingan',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontFamily: '')),
                      ),
                    ),
                  ),
                ),

                // Button Konfirmasi

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
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Konfirmasi',
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
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
