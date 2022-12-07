import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/detail_akun.dart';
import 'package:sicipe/login_page.dart';
import 'package:sicipe/tambah_resep.dart';

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
                  style: GoogleFonts.jost(color: Colors.white, fontSize: 20)))),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 35),
          Row(
            children: [
              SizedBox(width: 28),
              Image.asset('assets/icons/profile-picture.png'),
              SizedBox(width: 29),
              Text('Kimberly',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 18))),
              SizedBox(width: 165),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => detail_akun()));
                  }),
            ],
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detail_akun()));
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
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tambah_resep()));
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
          SizedBox(height: 5),
          Divider(color: Colors.grey, thickness: 0.2),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 28),
              Text('Resep Saya',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              SizedBox(width: 230),
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
          Divider(color: Colors.grey, thickness: 0.5),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 28),
              Text('Feeds Saya',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              SizedBox(width: 230),
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
          Divider(color: Colors.grey, thickness: 0.9),
          SizedBox(height: 5),
          Row(
            children: [
              SizedBox(width: 28),
              Text('Keamanan Akun',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              SizedBox(width: 198),
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
          Divider(color: Colors.grey, thickness: 0.95),
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
