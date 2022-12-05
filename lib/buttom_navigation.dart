import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/feeds_page.dart';
import 'package:sicipe/home_page.dart';
import 'package:sicipe/profile_saya.dart';
import 'package:sicipe/recipecategory_page.dart';
import 'package:sicipe/register_page.dart';
import 'package:sicipe/search.dart';
import 'package:sicipe/transaksi.dart';

class buttom_navigation extends StatefulWidget {
  const buttom_navigation({super.key});

  @override
  State<buttom_navigation> createState() => _buttom_navigationState();
}

class _buttom_navigationState extends State<buttom_navigation> {
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
