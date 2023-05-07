import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sicipe/create_recipe.dart';

import 'package:sicipe/purchased_recipes_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class resep_saya extends StatefulWidget {
  const resep_saya({super.key});

  @override
  State<resep_saya> createState() => _resep_sayaState();
}

class _resep_sayaState extends State<resep_saya> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> _data = [];
  String dataEmpty = "";

  void getData() {
    http
        .get(Uri.parse('http://10.0.2.2:8000/api/resepsaya/1'))
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = json.decode(response.body);
        setState(() {
          _data.addAll(decodedData["data"]);
        });
        if (_data.isEmpty) {
          dataEmpty = "True";
        } else {
          dataEmpty = "";
        }
        print('hallo');
        // print(_data[0]["id_resep"]);
        // _getImagePath();
      } else {
        throw Exception('Failed to load data');
      }
    });
  }

  Future<void> deleteResep(int id) async {
    final url =
        'http://10.0.2.2:8000/api/resep/$id'; // replace with your actual API endpoint
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      // The delete operation was successful
      print('Resep berhasil dihapus');
      setState(() {
        // Reload the page by updating the state
        _data.removeWhere((resep) => resep["id_resep"] == id);
      });
    } else if (response.statusCode == 404) {
      // The resep was not found
      print('Resep tidak ditemukan');
    } else {
      // There was an error while deleting the resep
      print('Terjadi kesalahan: ${response.reasonPhrase}');
    }
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
  Widget build(BuildContext context) {
    if (dataEmpty == "True") {
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
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          74,
                      child: ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 170,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
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
                                  width: 120,
                                  margin: EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    height: 120,
                                    child: FutureBuilder<String>(
                                      future: _getImagePath(
                                          _data[index]["foto_resep"]),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String> snapshot) {
                                        if (snapshot.hasData) {
                                          _imagePath = snapshot.data!;
                                          return Container(
                                              height: 120,
                                              width: 120,
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Container(
                                                  height: 120,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                          width: 0.5),
                                                      image: DecorationImage(
                                                          image: FileImage(
                                                              File(_imagePath)),
                                                          fit: BoxFit
                                                              .fitHeight))));
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _data[index]["nama_resep"],
                                        style: GoogleFonts.jost(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/icons/recipe_owner.png'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
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
                                          _data[index]["deskripsi_resep"],
                                          style: GoogleFonts.jost(
                                              color: Colors.black,
                                              fontSize: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Delete Confirmation'),
                                                    content: Text(
                                                        'Are you sure you want to delete this item?'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false),
                                                        child: Text('CANCEL'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true),
                                                        child: Text('DELETE'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ).then((value) {
                                                if (value != null && value) {
                                                  // Perform the delete operation here
                                                  deleteResep(
                                                      _data[index]["id_resep"]);
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(15, 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              backgroundColor:
                                                  Colors.deepOrange,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PurchasedRecipesDetailScreen(
                                                            id: _data[index]
                                                                ["id_resep"])),
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
                            );
                          })),
                  // Container(
                  //   height: 170,
                  //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black45,
                  //           offset: Offset(0, 2),
                  //           blurRadius: 5.0,
                  //         ),
                  //       ]),
                  //   child: Row(children: [
                  //     Container(
                  //       height: 120,
                  //       margin: EdgeInsets.only(right: 15),
                  //       child: Image.asset('assets/icons/sushi_roll.png'),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(vertical: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Sushi Rolls',
                  //             style: GoogleFonts.jost(
                  //                 color: Colors.black,
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //           Row(
                  //             children: [
                  //               Image.asset('assets/icons/recipe_owner.png'),
                  //               Padding(
                  //                 padding: const EdgeInsets.only(left: 5.0),
                  //                 child: Text(
                  //                   'Kimberly',
                  //                   style: GoogleFonts.jost(
                  //                       color: Colors.black,
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             width: 120,
                  //             child: Text(
                  //               'Makanan khas Jepang dari nasi yang dibentuk bersama lauk seperti daging dan sayuran.',
                  //               style: GoogleFonts.jost(
                  //                   color: Colors.black, fontSize: 12),
                  //               overflow: TextOverflow.ellipsis,
                  //               maxLines: 4,
                  //               textAlign: TextAlign.justify,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(width: 22),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(vertical: 5),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.end,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               IconButton(
                  //                   onPressed: () => {},
                  //                   icon: Icon(
                  //                     Icons.favorite,
                  //                     color: Colors.deepOrange,
                  //                   )),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               ElevatedButton(
                  //                 style: ElevatedButton.styleFrom(
                  //                   minimumSize: Size(15, 30),
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(5),
                  //                   ),
                  //                   backgroundColor: Colors.deepOrange,
                  //                 ),
                  //                 onPressed: () {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             const PurchasedRecipesDetailScreen(
                  //                                 id: 1)),
                  //                   );
                  //                 },
                  //                 child: Text(
                  //                   'Detail',
                  //                   style: GoogleFonts.jost(
                  //                       color: Colors.white,
                  //                       fontSize: 13,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ]),
                  // ),
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
                                              const PurchasedRecipesDetailScreen(
                                                  id: 1)),
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
    } else if (_data.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
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
                  SizedBox(
                      height: MediaQuery.of(context).size.height -
                          kToolbarHeight -
                          74,
                      child: ListView.builder(
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 170,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
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
                                  width: 120,
                                  margin: EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    height: 120,
                                    child: FutureBuilder<String>(
                                      future: _getImagePath(
                                          _data[index]["foto_resep"]),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<String> snapshot) {
                                        if (snapshot.hasData) {
                                          _imagePath = snapshot.data!;
                                          return Container(
                                              height: 120,
                                              width: 120,
                                              margin:
                                                  EdgeInsets.only(right: 15),
                                              child: Container(
                                                  height: 120,
                                                  width: 120,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                          width: 0.5),
                                                      image: DecorationImage(
                                                          image: FileImage(
                                                              File(_imagePath)),
                                                          fit: BoxFit
                                                              .fitHeight))));
                                        } else {
                                          return CircularProgressIndicator();
                                        }
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _data[index]["nama_resep"],
                                        style: GoogleFonts.jost(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                              'assets/icons/recipe_owner.png'),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
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
                                          _data[index]["deskripsi_resep"],
                                          style: GoogleFonts.jost(
                                              color: Colors.black,
                                              fontSize: 12),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        'Delete Confirmation'),
                                                    content: Text(
                                                        'Are you sure you want to delete this item?'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(false),
                                                        child: Text('CANCEL'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true),
                                                        child: Text('DELETE'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ).then((value) {
                                                if (value != null && value) {
                                                  // Perform the delete operation here
                                                  deleteResep(
                                                      _data[index]["id_resep"]);
                                                }
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(15, 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              backgroundColor:
                                                  Colors.deepOrange,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PurchasedRecipesDetailScreen(
                                                            id: _data[index]
                                                                ["id_resep"])),
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
                            );
                          })),
                  // Container(
                  //   height: 170,
                  //   margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black45,
                  //           offset: Offset(0, 2),
                  //           blurRadius: 5.0,
                  //         ),
                  //       ]),
                  //   child: Row(children: [
                  //     Container(
                  //       height: 120,
                  //       margin: EdgeInsets.only(right: 15),
                  //       child: Image.asset('assets/icons/sushi_roll.png'),
                  //     ),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(vertical: 10),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Text(
                  //             'Sushi Rolls',
                  //             style: GoogleFonts.jost(
                  //                 color: Colors.black,
                  //                 fontSize: 18,
                  //                 fontWeight: FontWeight.w500),
                  //           ),
                  //           Row(
                  //             children: [
                  //               Image.asset('assets/icons/recipe_owner.png'),
                  //               Padding(
                  //                 padding: const EdgeInsets.only(left: 5.0),
                  //                 child: Text(
                  //                   'Kimberly',
                  //                   style: GoogleFonts.jost(
                  //                       color: Colors.black,
                  //                       fontSize: 12,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           SizedBox(
                  //             width: 120,
                  //             child: Text(
                  //               'Makanan khas Jepang dari nasi yang dibentuk bersama lauk seperti daging dan sayuran.',
                  //               style: GoogleFonts.jost(
                  //                   color: Colors.black, fontSize: 12),
                  //               overflow: TextOverflow.ellipsis,
                  //               maxLines: 4,
                  //               textAlign: TextAlign.justify,
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //     SizedBox(width: 22),
                  //     Padding(
                  //       padding: EdgeInsets.symmetric(vertical: 5),
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.end,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Row(
                  //             children: [
                  //               IconButton(
                  //                   onPressed: () => {},
                  //                   icon: Icon(
                  //                     Icons.favorite,
                  //                     color: Colors.deepOrange,
                  //                   )),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               ElevatedButton(
                  //                 style: ElevatedButton.styleFrom(
                  //                   minimumSize: Size(15, 30),
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: BorderRadius.circular(5),
                  //                   ),
                  //                   backgroundColor: Colors.deepOrange,
                  //                 ),
                  //                 onPressed: () {
                  //                   Navigator.push(
                  //                     context,
                  //                     MaterialPageRoute(
                  //                         builder: (context) =>
                  //                             const PurchasedRecipesDetailScreen(
                  //                                 id: 1)),
                  //                   );
                  //                 },
                  //                 child: Text(
                  //                   'Detail',
                  //                   style: GoogleFonts.jost(
                  //                       color: Colors.white,
                  //                       fontSize: 13,
                  //                       fontWeight: FontWeight.w500),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ]),
                  // ),
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
                                              const PurchasedRecipesDetailScreen(
                                                  id: 1)),
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
}
