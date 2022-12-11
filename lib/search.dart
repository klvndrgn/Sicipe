import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/model/search_model.dart';
import 'package:sicipe/home_page.dart';
import 'package:sicipe/recipes_detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  void updateList(String value) {}

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController? _textEditingController = TextEditingController();
  FocusNode searchNode = FocusNode();
  List<Search> searchs = allSearch;

  @override
  Widget build(BuildContext context) {
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
                  autofocus: true,
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
      body: Column(children: <Widget>[
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hasil Pencarian',
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 120),
            Text(
              '5 Resep ditemukan',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchs.length,
            itemBuilder: (context, index) {
              final search = searchs[index];
              return Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: 380,
                    height: 180,
                    decoration: BoxDecoration(
                        // color: Colors.orange[50],

                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage(search.search_url),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Container(
                            width: 250.0,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              search.search_title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                          Container(
                            width: 250.0,
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              search.release_by,
                              style: TextStyle(
                                  color: Colors.grey[900], fontSize: 17),
                            ),
                          )
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: Colors.deepOrange,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecipesDetailScreen()));
                            },
                            child: Text(
                              'Detail',
                              style: GoogleFonts.jost(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ]),
    );
  }
}
