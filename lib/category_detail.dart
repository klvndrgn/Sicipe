import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/model/search_model.dart';
import 'package:sicipe/recipes_detail.dart';

class category_detail extends StatefulWidget {
  const category_detail({super.key});

  void updateList(String value) {}

  @override
  State<category_detail> createState() => _category_detailState();
}

class _category_detailState extends State<category_detail> {
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
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text('Cemilan',
                style: GoogleFonts.jost(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
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
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 12),
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
                                      const RecipesDetailScreen()),
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
                child: Image.asset('assets/icons/Risol.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Risol Ayam',
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
                            'Mariz Lauran',
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
                        'Risol ayam adalah pastri daging ayam cincang, dan sayuran dibungkus dadar.',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 12),
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
                                      const RecipesDetailScreen()),
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
                child: Image.asset('assets/icons/Gendang.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Luti Gendang',
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
                            'Roma A.',
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
                        'Makanan yang terbuat dari roti goreng berisi abon ikan ataupun ayam.',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 12),
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
                                      const RecipesDetailScreen()),
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
                child: Image.asset('assets/icons/Martabak.png'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Martabak Manis',
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
                            'Roma A.',
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
                        'Martabak yang lembut, kenyal, berpadu dengan topping cokelat atau kacang renyah.',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 12),
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
                                      const RecipesDetailScreen()),
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
    );
  }
}
