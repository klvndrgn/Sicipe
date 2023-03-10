import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/model/search_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PurchasedRecipesDetailScreen extends StatefulWidget {
  final int id;
  const PurchasedRecipesDetailScreen({required this.id});

  void updateList(String value) {}

  @override
  State<PurchasedRecipesDetailScreen> createState() =>
      _PurchasedRecipesDetailScreen();
}

class _PurchasedRecipesDetailScreen
    extends State<PurchasedRecipesDetailScreen> {
  TextEditingController? _textEditingController = TextEditingController();
  FocusNode searchNode = FocusNode();
  List<Search> searchs = allSearch;

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String _imagePath = '';
  Future<String> _getImagePath(imagesource) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = imagesource;
    final path = '${directory.path}/$fileName';
    setState(() {
      _imagePath = path;
    });
    return _imagePath;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> _data = [];

  void getData() {
    http
        .get(
            Uri.parse('http://10.0.2.2:8000/api/resep/' + widget.id.toString()))
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = json.decode(response.body);
        setState(() {
          _data.add(decodedData["data"]);
        });
        print('hallo1');
        print(decodedData["data"]["foto_resep"]);
        // _getImagePath();
      } else {
        throw Exception('Failed to load data');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 280,
                  height: 35,
                  child: TextField(
                    focusNode: searchNode,
                    onEditingComplete: (() => searchNode.requestFocus()),
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: EdgeInsets.all(2),
                        hintText: 'Cari Menu Resep atau Pemilik Resep',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        )),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // buildTextTitleVariation1()
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 310,
                  padding: EdgeInsets.only(left: 16),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // buildTextTitleVariation2('')
                          buildNutrition(_data[0]["level"].toString(),
                              'Icons.star_outlined', 'Kcal'),

                          SizedBox(
                            height: 16,
                          ),

                          buildNutrition2(
                              _data[0]["jumlah_kalori"].toInt() ?? 0,
                              'Icons.star_outlined',
                              'Kal'),

                          SizedBox(
                            height: 16,
                          ),

                          buildNutrition3(_data[0]["durasi_masak"].toInt() ?? 0,
                              'Icons.star_outlined', 'Men'),
                        ],
                      ),
                      Positioned(
                        right: 20,
                        child: Hero(
                          tag: 'assets/tomyam.png',
                          child: FutureBuilder<String>(
                            future: _getImagePath(_data[0]["foto_resep"]),
                            builder: (BuildContext context,
                                AsyncSnapshot<String> snapshot) {
                              if (snapshot.hasData) {
                                _imagePath = snapshot.data!;
                                return Container(
                                    height: 260,
                                    width: 260,
                                    margin: EdgeInsets.only(right: 15),
                                    child: Container(
                                        height: 260,
                                        width: 260,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(width: 4),
                                            image: DecorationImage(
                                                image:
                                                    FileImage(File(_imagePath)),
                                                fit: BoxFit.fitHeight))));
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        top: 270,
                        child: Text(
                          _data[0]["nama_resep"].toString(),
                          style: GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 21,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        top: 330,
                        child: Text(
                          _data[0]["nama_resep"].toString(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    Container(
                      width: 360.0,
                      alignment: Alignment.center,
                      child: Text(
                        _data[0]["deskripsi_resep"].toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                    // SizedBox(height: 10,),
                    //   Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: Container(
                    //     child: ElevatedButton(
                    //       style: ElevatedButton.styleFrom(
                    //         minimumSize: Size(350, 40),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(7),
                    //         ),
                    //         backgroundColor: Colors.redAccent[700],
                    //       ),
                    //       onPressed: () {
                    //         // Navigator.pushReplacement(
                    //         //     context,
                    //         //     MaterialPageRoute(
                    //         //         builder: (context) => RecipesDetailScreen()));
                    //       },
                    //       child: Text(
                    //         'Rp. 15.000,00',
                    //         style: GoogleFonts.jost(
                    //             color: Colors.white,
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                        child: Column(children: [
                      Container(
                        width: 460.0,
                        padding: EdgeInsets.only(left: 30, right: 0, top: 10),
                        // alignment: Alignment.centerLeft,
                        child: Text(
                          'Resep',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.jost(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      )
                    ])),

                    Container(
                        child: Row(children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var item in _data[0]["bahan_dan_alat"]
                                .toString()
                                .split(','))
                              Row(
                                children: [
                                  Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      shape: BoxShape.circle,
                                      // boxShadow: [kBoxShadow],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    item.trim(),
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.jost(fontSize: 17.5),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ])),

                    Container(
                        child: Column(children: [
                      Container(
                        width: 460.0,
                        padding: EdgeInsets.only(left: 30, right: 0, top: 10),
                        // alignment: Alignment.centerLeft,
                        child: Text(
                          'Cara Membuat Tom Yam :',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.jost(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      )
                    ])),

                    Container(
                        //  padding: EdgeInsets.only(left: 0, right: 20, top: 0),
                        child: Row(children: [
                      SizedBox(
                        width: 30,
                      ),
                      // SizedBox(height: 200,),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var item
                                in _data[0]["cara_kerja"].toString().split(','))
                              Row(
                                children: [
                                  Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange,
                                      shape: BoxShape.circle,
                                      // boxShadow: [kBoxShadow],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    item.trim(),
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.jost(fontSize: 17.5),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ])),
                  ],
                )),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //     height: 110,
                //     padding: EdgeInsets.only(left: 30),
                //     decoration: BoxDecoration(
                //       color: Colors.deepOrange,
                //       shape: BoxShape.rectangle,
                //       // boxShadow: [kBoxShadow],
                //     ),
                //     child: Stack(children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           // buildTextTitleVariation2('')
                //           SizedBox(
                //             height: 5,
                //           ),
                //           Text(
                //             "Berikan Penilaian Anda !",
                //             style: GoogleFonts.jost(
                //               fontSize: 20,
                //               color: Colors.black,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           ),
                //           Container(
                //               padding: EdgeInsets.only(
                //                   top: 10, bottom: 10, right: 15),
                //               child: Row(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   mainAxisAlignment: MainAxisAlignment.center,
                //                   children: [
                //                     Icon(
                //                       Icons.star_border_sharp,
                //                       color: Colors.white,
                //                       size: 45,
                //                     ),
                //                     SizedBox(
                //                       height: 10,
                //                     ),
                //                     Icon(
                //                       Icons.star_border_sharp,
                //                       color: Colors.white,
                //                       size: 45,
                //                     ),
                //                     SizedBox(
                //                       height: 10,
                //                     ),
                //                     Icon(
                //                       Icons.star_border_sharp,
                //                       color: Colors.white,
                //                       size: 45,
                //                     ),
                //                     SizedBox(
                //                       height: 10,
                //                     ),
                //                     Icon(
                //                       Icons.star_border_sharp,
                //                       color: Colors.white,
                //                       size: 45,
                //                     ),
                //                     SizedBox(
                //                       height: 10,
                //                     ),
                //                     Icon(
                //                       Icons.star_border_sharp,
                //                       color: Colors.white,
                //                       size: 45,
                //                     ),
                //                   ]))
                //         ],
                //       ),
                //     ]))
              ],
            )),
        // bottomNavigationBar: bottomNavigationBar,
      );
    }
  }

  Widget buildNutrition(String value, String title, String subtitle) {
    return Container(
      height: 80,
      width: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        // boxShadow: [kBoxShadow],
      ),
      child: Column(children: [
        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
            child: Icon(
              Icons.star_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),

        SizedBox(
          height: 10,
        ),

        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
              child: Text(
            value.toString(),
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       title,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),

        //     Text(
        //       subtitle,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.grey[400],
        //       ),
        //     ),
        //   ],
        // )
      ]),
    );
  }

  Widget buildNutrition2(int value, String title, String subtitle) {
    return Container(
      height: 80,
      width: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        // boxShadow: [kBoxShadow],
      ),
      child: Column(children: [
        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
            child: Icon(
              Icons.local_fire_department,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),

        // SizedBox(
        //   height: 10,
        // ),

        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
              child: Text(
            value.toString(),
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
              child: Text(
            subtitle,
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       title,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),

        //     Text(
        //       subtitle,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.grey[400],
        //       ),
        //     ),
        //   ],
        // )
      ]),
    );
  }

  Widget buildNutrition3(int value, String title, String subtitle) {
    return Container(
      height: 80,
      width: 50,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        // boxShadow: [kBoxShadow],
      ),
      child: Column(children: [
        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
            child: Icon(
              Icons.timer,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),

        // SizedBox(
        //   height: 10,
        // ),

        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
              child: Text(
            value.toString(),
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        Container(
          // height: 44,
          // width: 44,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
            // boxShadow: [kBoxShadow],
          ),
          child: Center(
              child: Text(
            subtitle,
            style: GoogleFonts.jost(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text(
        //       title,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),

        //     Text(
        //       subtitle,
        //       style: TextStyle(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //         color: Colors.grey[400],
        //       ),
        //     ),
        //   ],
        // )
      ]),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            backgroundColor: Colors.deepOrange,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: true,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.add_shopping_cart,
                ),
                backgroundColor: Colors.amberAccent,
                label: 'Masuk Keranjang',
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.shopping_cart,
                ),
                // title: new Text('Order'),
                label: 'Beli Sekarang',
              ),
              // BottomNavigationBarItem(
              //   icon: new Icon(Icons.mail),
              //   // title: new Text('Messages'),
              //   label: 'home',
              // ),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.more_horiz_rounded),
              //     label: 'home', ),
            ],
          ),
        ));
  }
}
