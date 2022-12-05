import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/home_page.dart';
import 'package:sicipe/login_page.dart';
import 'package:sicipe/register_page.dart';
import 'package:sicipe/search.dart';

class profile_saya extends StatefulWidget {
  const profile_saya({super.key});

  @override
  State<profile_saya> createState() => _profile_sayaState();
}

class _profile_sayaState extends State<profile_saya> {
  int _currentIndex = 0;
  List _screens = [HomeScreen(), RegisterPage(), LoginScreen(), profile_saya()];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('Profile Saya',
                  style: GoogleFonts.jost(color: Colors.white, fontSize: 20)))),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: 35),
          Row(
            children: [
              SizedBox(width: 26),
              Image.asset('assets/icons/profile-picture.png'),
              SizedBox(width: 29),
              Text('Kimberly',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 18))),
              SizedBox(width: 165),
              Icon(Icons.arrow_forward_ios,
                  size: 19, color: Color.fromARGB(255, 207, 203, 203))
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.5),
          SizedBox(height: 8),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 6),
                      Text('Saldo Saya',
                          style: (GoogleFonts.jost(
                              color: Colors.black, fontSize: 16))),
                    ],
                  ),
                  SizedBox(height: 10),
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
                              builder: (context) => LoginScreen()));
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
              SizedBox(width: 20),
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
                              builder: (context) => LoginScreen()));
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
          SizedBox(height: 8),
          Divider(color: Colors.grey, thickness: 0.5),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 26),
              Text('Resep Saya',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              SizedBox(width: 230),
              Icon(Icons.arrow_forward_ios,
                  size: 21, color: Color.fromARGB(255, 207, 203, 203))
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.5),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 26),
              Text('Feeds Saya',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              SizedBox(width: 230),
              Icon(Icons.arrow_forward_ios,
                  size: 21, color: Color.fromARGB(255, 207, 203, 203))
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.5),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 26),
              Text('Keamanan Akun',
                  style: (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              SizedBox(width: 198),
              Icon(Icons.arrow_forward_ios,
                  size: 21, color: Color.fromARGB(255, 207, 203, 203))
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey, thickness: 0.5),
        ]),
      ),

      // Navigation

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
        items: [
          // Home
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.deepOrange,
              ),
              label: 'Beranda'),

          // Feeds
          BottomNavigationBarItem(
              icon: Icon(
                Icons.groups,
                color: Colors.deepOrange,
              ),
              label: 'Feeds'),

          // Transaksi
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.deepOrange,
              ),
              label: 'Transaksi'),

          // Profile
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.deepOrange,
              ),
              label: 'Profile'),
        ],
      ),
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
