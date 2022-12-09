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
          // Feeds 1
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 2),
                      blurRadius: 8.0),
                ],
              ),
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.all(9.0),
                          width: 40.0,
                          height: 40.0,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ]),
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image(
                                height: 40.0,
                                width: 40.0,
                                image: AssetImage(
                                    'assets/icons/profile-picture.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          'Kimberly',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 14),
                        ),
                        subtitle: Text(
                          '30 minutes ago',
                          style: GoogleFonts.jost(
                              color: Colors.grey.shade400, fontSize: 10),
                        ),
                        trailing: IconButton(
                          color: Colors.deepOrange,
                          icon: Icon(Icons.more_horiz),
                          onPressed: () => print('More'),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5),
                              child: Text(
                                'My favorite food is sushi you can wake me up for it at night 🥰🍣',
                                style: GoogleFonts.jost(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/sushi.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border))
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.comment_outlined))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          // Feeds 2
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              width: double.infinity,
              height: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 2),
                      blurRadius: 8.0),
                ],
              ),
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          margin: EdgeInsets.all(9.0),
                          width: 40.0,
                          height: 40.0,
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ]),
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image(
                                height: 40.0,
                                width: 40.0,
                                image: AssetImage(
                                    'assets/icons/profile-picture2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          'George Michael',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 14),
                        ),
                        subtitle: Text(
                          '1 hours ago',
                          style: GoogleFonts.jost(
                              color: Colors.grey.shade400, fontSize: 10),
                        ),
                        trailing: IconButton(
                          color: Colors.deepOrange,
                          icon: Icon(Icons.more_horiz),
                          onPressed: () => print('More'),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 15, right: 15, bottom: 5),
                              child: Text(
                                'For my last meal here on Earth, I want a nicely cooked steak!!',
                                style: GoogleFonts.jost(
                                    color: Colors.black, fontSize: 14),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.zero,
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/steak.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_border))
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.comment_outlined))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Create Post',
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.add),
      ),
    );
  }
}
// Sample for Add Comment Input
                // Padding(
                //   // padding: EdgeInsets.all(10),
                //   // padding: EdgeInsets.only(left: 40.0),
                //   padding: EdgeInsets.symmetric(vertical: 50.0),
                //   child: Container(
                //     margin: EdgeInsets.only(left: 150, right: 150),
                //     child: SizedBox(
                //       width: 150,
                //       height: 40,
                //       child: TextField(
                //         decoration: InputDecoration(
                //             hintText: 'Add a comment...',
                //             hintStyle: TextStyle(fontSize: 12.0),
                //             border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(20))),
                //       ),
                //     ),
                //   ),
                // ),