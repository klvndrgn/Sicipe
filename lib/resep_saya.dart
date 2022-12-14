import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/login_page.dart';

class resep_saya extends StatefulWidget {
  const resep_saya({super.key});

  @override
  State<resep_saya> createState() => _resep_sayaState();
}

class _resep_sayaState extends State<resep_saya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Resep Saya',
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset('assets/icons/cireng.png'),
                  ],
                ),
                Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cireng',
                              style: (GoogleFonts.jost(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)))
                        ]),
                    Row(children: [
                      Text('Kimberly',
                          style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500))),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 220,
                            height: 64,
                            child: Text(
                              'Makanan ringan tradisional dari Sunda yang memiliki tekstur kenyal dan harus digoreng terlebih dahulu sebelum dikonsumsi.',
                              style: GoogleFonts.jost(
                                  color: Colors.black, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [],
                    ),
                    Row(
                      children: [],
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),

      // Navigation
    );
  }
}
