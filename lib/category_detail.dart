import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/model/search_model.dart';
import 'package:sicipe/recipes_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class category_detail extends StatefulWidget {
  final String nama;
  const category_detail({required this.nama});

  void updateList(String value) {}

  @override
  State<category_detail> createState() => _category_detailState();
}

class _category_detailState extends State<category_detail> {
  TextEditingController? _textEditingController = TextEditingController();
  FocusNode searchNode = FocusNode();
  List<Search> searchs = allSearch;
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> _data = [];

  void getData() async {
    final response = await http.get(
        Uri.parse('http://10.0.2.2:8000/api/reseps/' + widget.nama.toString()));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedData = json.decode(response.body);
      setState(() {
        _data.addAll(decodedData["data"]);
      });
      print(_data);
      print(_data.length);
      print(decodedData["data"][0]["id_resep"]);
      // _getImagePath(_data[0]["foto_resep"]);
    } else {
      throw Exception('Failed to load data');
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
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(widget.nama.toString(),
                  style: GoogleFonts.jost(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
            ),
            SizedBox(
                height:
                    MediaQuery.of(context).size.height - kToolbarHeight - 74,
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    // _getImagePath("my_image3.png");
                    return Container(
                      height: 170,
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            margin: EdgeInsets.only(right: 15),
                            child: SizedBox(
                              height: 120,
                              child: FutureBuilder<String>(
                                future:
                                    _getImagePath(_data[index]["foto_resep"]),
                                builder: (BuildContext context,
                                    AsyncSnapshot<String> snapshot) {
                                  if (snapshot.hasData) {
                                    _imagePath = snapshot.data!;
                                    return Container(
                                        height: 120,
                                        width: 120,
                                        margin: EdgeInsets.only(right: 15),
                                        child: Container(
                                            height: 120,
                                            width: 120,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                border: Border.all(width: 0.5),
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        File(_imagePath)),
                                                    fit: BoxFit.fitHeight))));
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    _data[index]["deskripsi_resep"],
                                    style: GoogleFonts.jost(
                                        color: Colors.black, fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
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
                                    // IconButton(
                                    //   onPressed: () => {},
                                    //   icon: Icon(
                                    //     Icons.favorite,
                                    //     color: Colors.deepOrange,
                                    //   ),
                                    // ),
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
                                        backgroundColor: Colors.deepOrange,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RecipesDetailScreen(
                                                    id: _data[index]
                                                        ["id_resep"]),
                                          ),
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
                        ],
                      ),
                    );
                  },
                )),
          ])));
    }
  }
}
