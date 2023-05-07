import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/transaksipage/belum_bayar.dart';
import 'package:sicipe/transaksipage/sudah_bayar.dart';

class transaksi extends StatefulWidget {
  const transaksi({super.key});

  @override
  State<transaksi> createState() => _transaksiState();
}

class _transaksiState extends State<transaksi> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Transaksi',
              style: GoogleFonts.jost(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TabBar(
                indicatorColor: Colors.deepOrange,
                controller: _tabController,
                labelColor: Colors.deepOrange,
                tabs: [Tab(text: 'Belum Dibayar'), Tab(text: 'Selesai')],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 500,
              child: TabBarView(
                controller: _tabController,
                children: [BelumBayar(), SudahBayar()],
              ),
            )
          ],
        ));
  }
}
