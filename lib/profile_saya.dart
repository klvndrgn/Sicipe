import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/detail_akun.dart';
import 'package:sicipe/login_page.dart';
import 'package:sicipe/create_recipe.dart';
import 'package:sicipe/resep_saya.dart';
import 'package:sicipe/keamanan_akun.dart';

class profile_saya extends StatefulWidget {
  const profile_saya({super.key});

  @override
  State<profile_saya> createState() => _profile_sayaState();
}

class _profile_sayaState extends State<profile_saya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text('Profile Saya',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)))),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 35),
            child: Row(
              children: [
                Image.asset('assets/icons/profile-picture.png'),
                SizedBox(width: 29),
                Text('Kimberly',
                    style:
                        (GoogleFonts.jost(color: Colors.black, fontSize: 18))),
                SizedBox(width: 165),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const detail_akun()),
                      );
                    }),
              ],
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.8),
          SizedBox(height: 5),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 8),
                      Text('Saldo Saya',
                          style: (GoogleFonts.jost(
                              color: Colors.black, fontSize: 16))),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(width: 26),
                      Text('Rp.810.500',
                          style: (GoogleFonts.jost(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.w500,
                              fontSize: 18)))
                    ],
                  )
                ],
              ),
              SizedBox(width: 45),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(95, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const detail_akun()),
                      );
                    },
                    child: Text(
                      'Top Up',
                      style: GoogleFonts.jost(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(width: 22),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(95, 33),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const tambah_resep()),
                      );
                    },
                    child: Text(
                      'Tarik Saldo',
                      style: GoogleFonts.jost(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 28),
                child: Text('Resep Saya',
                    style:
                        (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const resep_saya()),
                    );
                  }),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 28),
                child: Text('Feeds Saya',
                    style:
                        (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
            ],
          ),
          SizedBox(height: 5),
          Divider(color: Colors.grey, thickness: 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 28),
                child: Text('Keamanan Akun',
                    style:
                        (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const keamanan_akun()),
                    );
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

class ItemKategoriResep extends StatelessWidget {
  const ItemKategoriResep({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 82,
          height: 28,
          child: Image.asset(
            icon,
          ),
        ),
        SizedBox(
          width: 82,
          child: Text(
            title,
            style: GoogleFonts.jost(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
