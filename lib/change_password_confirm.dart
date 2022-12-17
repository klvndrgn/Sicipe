import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/bottom_navigation.dart';

class change_password_confirm extends StatefulWidget {
  const change_password_confirm({super.key});
  @override
  State<change_password_confirm> createState() =>
      _change_password_confirmState();
}

class _change_password_confirmState extends State<change_password_confirm> {
  bool _obscureTexts = true;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Ganti Kata Sandi',
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
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              'Masukkan Kata Sandi Saat Ini',
              style: GoogleFonts.jost(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 25),
              Text('Kata Sandi',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 20))),
            ],
          ),
          SizedBox(height: 10),
          // password
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
                  obscureText: _obscureText,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Masukkan Kata Sandi',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 15, fontFamily: ''),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
                ),
              ),
            ),
          ),

          SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 25),
              Text('Konfirmasi Kata Sandi',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 20))),
            ],
          ),
          SizedBox(height: 10),
          // password
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
                  obscureText: _obscureTexts,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Masukkan Ulang Kata Sandi',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 15, fontFamily: ''),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureTexts = !_obscureTexts;
                          });
                        },
                        child: Icon(_obscureTexts
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )),
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
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return bottom_navigation();
                  }), (r) {
                    return false;
                  });
                },
                child: Text(
                  'Konfirmasi',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
