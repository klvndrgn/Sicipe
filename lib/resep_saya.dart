import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sicipe/create_recipe.dart';
import 'package:sicipe/detail_akun.dart';
import 'package:sicipe/purchased_recipes_detail.dart';

class resep_saya extends StatefulWidget {
  const resep_saya({super.key});

  @override
  State<resep_saya> createState() => _resep_sayaState();
}

class _resep_sayaState extends State<resep_saya> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
            ),
            bottom: TabBar(indicatorColor: Colors.deepOrange, tabs: [
              Tab(text: "Resep yang Diunggah"),
              Tab(
                text: "Resep yang Dibeli",
              )
            ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 170,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Row(children: [
                    Container(
                      height: 120,
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset('assets/icons/Cireng.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cireng',
                            style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/icons/recipe_owner.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Kimberly',
                                  style: GoogleFonts.jost(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Makanan tradisional khas dari Sunda yang memiliki tekstur kenyal dan digoreng.',
                              style: GoogleFonts.jost(
                                  color: Colors.black, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 22),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.deepOrange,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(15, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PurchasedRecipesDetailScreen()),
                                  );
                                },
                                child: Text(
                                  'Detail',
                                  style: GoogleFonts.jost(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: 170,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Row(children: [
                    Container(
                      height: 120,
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset('assets/icons/sushi_roll.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sushi Rolls',
                            style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/icons/recipe_owner.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Kimberly',
                                  style: GoogleFonts.jost(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Makanan khas Jepang dari nasi yang dibentuk bersama lauk seperti daging dan sayuran.',
                              style: GoogleFonts.jost(
                                  color: Colors.black, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 22),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.deepOrange,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(15, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PurchasedRecipesDetailScreen()),
                                  );
                                },
                                child: Text(
                                  'Detail',
                                  style: GoogleFonts.jost(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            )),
            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 170,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 5.0,
                        ),
                      ]),
                  child: Row(children: [
                    Container(
                      height: 120,
                      margin: EdgeInsets.only(right: 15),
                      child: Image.asset('assets/icons/Cireng.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cireng',
                            style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/icons/recipe_owner.png'),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text(
                                  'Kimberly',
                                  style: GoogleFonts.jost(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              'Makanan tradisional khas dari Sunda yang memiliki tekstur kenyal dan digoreng.',
                              style: GoogleFonts.jost(
                                  color: Colors.black, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 22),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.deepOrange,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(15, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  backgroundColor: Colors.deepOrange,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PurchasedRecipesDetailScreen()),
                                  );
                                },
                                child: Text(
                                  'Detail',
                                  style: GoogleFonts.jost(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ))
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tambah_resep()),
              );
            },
            tooltip: 'Create Post',
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.add),
          ),
          // Navigation
        ));
  }
}
