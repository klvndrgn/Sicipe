import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feeds',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 320.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.red,
            ),
            child: Column(children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            ]),
          )
        ],
      ),
    );
  }
}
