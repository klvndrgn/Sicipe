import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sicipe/create_recipe.dart';
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
            bottom: TabBar(tabs: [
              Tab(text: "Resep yang Diunggah"),
              Tab(
                text: "Resep yang Dibeli",
              )
            ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 20.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/icons/Cireng.png'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 129),
                                    child: Text('Cireng',
                                        style: (GoogleFonts.jost(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))),
                                  )
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Image.asset(
                                      'assets/icons/recipe_owner.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: Text('Kimberly',
                                      style: (GoogleFonts.jost(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))),
                                ),
                                SizedBox(width: 85),
                                Image.asset('assets/icons/star.png'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 1.0),
                                  child: Text('4.5',
                                      style: (GoogleFonts.jost(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 178,
                                    height: 64,
                                    child: Text(
                                      'Makanan ringan tradisional dari Sunda yang memiliki tekstur kenyal dan harus digoreng terlebih dahulu sebelum dikonsumsi.',
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
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.favorite))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(58, 20),
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
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/icons/sushi_roll.png'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 108),
                                    child: Text('Sushi Rolls',
                                        style: (GoogleFonts.jost(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500))),
                                  )
                                ]),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Image.asset(
                                      'assets/icons/recipe_owner.png'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 7.0),
                                  child: Text('Kimberly',
                                      style: (GoogleFonts.jost(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))),
                                ),
                                SizedBox(width: 85),
                                Image.asset('assets/icons/star.png'),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 1.0),
                                  child: Text('4.5',
                                      style: (GoogleFonts.jost(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))),
                                )
                              ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 178,
                                    height: 64,
                                    child: Text(
                                      'Makanan ringan tradisional dari Sunda yang memiliki tekstur kenyal dan harus digoreng terlebih dahulu sebelum dikonsumsi.',
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
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () => {},
                                    icon: Icon(
                                      Icons.favorite,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(58, 20),
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
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ]),
            ),
            SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 4, top: 20.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/icons/Cireng.png'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 129),
                                  child: Text('Cireng',
                                      style: (GoogleFonts.jost(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500))),
                                )
                              ]),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Image.asset(
                                    'assets/icons/recipe_owner.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7.0),
                                child: Text('Kimberly',
                                    style: (GoogleFonts.jost(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500))),
                              ),
                              SizedBox(width: 85),
                              Image.asset('assets/icons/star.png'),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Text('4.5',
                                    style: (GoogleFonts.jost(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500))),
                              )
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 5),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 178,
                                  height: 64,
                                  child: Text(
                                    'Makanan ringan tradisional dari Sunda yang memiliki tekstur kenyal dan harus digoreng terlebih dahulu sebelum dikonsumsi.',
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
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () => {},
                                  icon: Icon(Icons.favorite))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(58, 20),
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
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]))
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
