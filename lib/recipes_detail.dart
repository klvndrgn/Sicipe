import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/model/search_model.dart';
import 'package:sicipe/purchased_recipes_detail.dart';

class RecipesDetailScreen extends StatefulWidget {
  const RecipesDetailScreen({super.key});

  void updateList(String value) {}

  @override
  State<RecipesDetailScreen> createState() => _RecipesDetailScreen();
}

class _RecipesDetailScreen extends State<RecipesDetailScreen> {
  TextEditingController? _textEditingController = TextEditingController();
  FocusNode searchNode = FocusNode();
  List<Search> searchs = allSearch;

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
                        buildNutrition(4.5, 'Icons.star_outlined', 'Kcal'),

                        SizedBox(
                          height: 16,
                        ),

                        buildNutrition2(80, 'Icons.star_outlined', 'Kal'),

                        SizedBox(
                          height: 16,
                        ),

                        buildNutrition3(35, 'Icons.star_outlined', 'Men'),
                      ],
                    ),
                    Positioned(
                      right: 20,
                      child: Hero(
                        tag: 'assets/tomyam.png',
                        child: Container(
                          height: 260,
                          width: 260,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4),
                              image: DecorationImage(
                                  image: AssetImage('assets/tomyam.png'),
                                  fit: BoxFit.fitHeight)),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 270,
                      child: Text(
                        'TOM YAM PEDAS GURIH',
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 330,
                      child: Text(
                        'TOM YAM PEDAS GURIH',
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
                      'Tom Yam biasanya disajikan sebagai hidangan pembuka, sup pedas tersebut secara tradisional dihiasi dengan daun ketumbar diatasnya.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.jost(fontSize: 17.5),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(350, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          backgroundColor: Colors.redAccent[700],
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PurchasedRecipesDetailScreen()));
                        },
                        child: Text(
                          'Rp. 15.000,00',
                          style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
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
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        // boxShadow: [kBoxShadow],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Santan Kental 200 ml',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        // boxShadow: [kBoxShadow],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Cumi 150 gr',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                  ])),
                  Container(
                      child: Row(children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        // boxShadow: [kBoxShadow],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Kaldu Udang 800 ml',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        // boxShadow: [kBoxShadow],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Tomat 1 buah',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                  ])),
                  Container(
                      child: Row(children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        // boxShadow: [kBoxShadow],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Cabai Rawit Merah',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                    SizedBox(
                      width: 38,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                        // boxShadow: [kBoxShadow],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Daun Jeruk 3 lbr',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                  ])),
                  Container(
                      child: Row(children: [
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Udang 250 gr',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                    SizedBox(
                      width: 72,
                    ),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 0, top: 0),
                      child: Text(
                        'Jamur 75 gr',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.jost(fontSize: 17.5),
                      ),
                    ),
                  ])),
                ],
              )),
              SizedBox(
                height: 20,
              )
            ],
          )),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  Widget buildNutrition(double value, String title, String subtitle) {
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
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
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
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
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
      ),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
          ),
          child: Center(
            child: Icon(
              Icons.timer,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
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
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            shape: BoxShape.rectangle,
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
            ],
          ),
        ));
  }
}
