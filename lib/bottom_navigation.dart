import 'package:flutter/material.dart';
import 'package:sicipe/feeds_page.dart';
import 'package:sicipe/home_page.dart';
import 'package:sicipe/profile_saya.dart';
import 'package:sicipe/transaksi.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({super.key});

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    FeedScreen(),
    transaksi(),
    profile_saya()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Navigation
      body: _children[_currentIndex],
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
