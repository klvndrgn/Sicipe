import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  TextEditingController? _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: SizedBox(
            width: 340,
            height: 40,
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(5),
                  hintText: 'Cari Menu Resep atau Pemilik Resep',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  )),
            ),
          ),
        ),
      ),
      body: Container(),
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
