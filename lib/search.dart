import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/model/search_model.dart';
import 'package:sicipe/register_page.dart';
import 'package:sicipe/home_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  void updateList(String value){

  }

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentIndex = 0;
  int _current = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // final List<String> imgList = [
  //   'https://asianfoodnetwork.com/content/dam/afn/global/en/recipes/ayam-penyet/AFN_ayam_penyet_main_image.jpg.transform/recipestep-img/img.jpg',
  //   'https://asset.kompas.com/crops/yjf8riNAL8ig7m0uQa-vohWvLNI=/0x5:7360x4912/750x500/data/photo/2021/12/02/61a88dd7b8e1d.jpg',
  //   'https://www.kitchensanctuary.com/wp-content/uploads/2020/07/Nasi-Goreng-square-FS-57.jpg',
  //   'https://asset.kompas.com/crops/ngoU4gEYBvC42FH0QV-5--6SAgk=/3x0:700x465/780x390/data/photo/2021/01/06/5ff59a5dafb31.jpg',
  //   'https://asset.kompas.com/crops/5u2ge0cWoJj0HOct3B1imjsjbLA=/0x244:800x777/780x390/data/photo/2021/05/23/60a9b166c6503.jpeg'
  // ];

  TextEditingController? _textEditingController = TextEditingController();
  FocusNode searchNode = FocusNode();
  List<Search> searchs = allSearch;
  final CarouselController _controller = CarouselController();

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
       Navigator.pushReplacement(
       context,
       MaterialPageRoute(
       builder: (context) => HomeScreen()));
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
              //    onTap: () {
              //     Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //     builder: (context) => SearchScreen()));
              // }, 
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
      body: Column(
        children: <Widget>[
                SizedBox(height: 10),
           Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hasil Pencarian',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    SizedBox(width: 35),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: (Text(
                        '',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      )),
                    ),
                    SizedBox(width: 15),
                    Text(
                      '5 Resep ditemukan',
                      style:
                          TextStyle( color: Colors.grey[600],fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ],
                ),
          Expanded(
              child: ListView.builder(
                itemCount: searchs.length,
                itemBuilder: (context, index){
                  final search = searchs[index];
                  return 
                   Column(
                     children: [
                        
                       SizedBox(height: 10),
                        Container(
                          
                            padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                            width: 380,
                            height: 150,
                            decoration: BoxDecoration(
                            // color: Colors.orange[50],
                            
                             border: Border.all(color: Colors.black, width: 2 ),
                            borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(image: AssetImage(search.search_url),
                      fit: BoxFit.cover)
                        ),
                    ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(children: [
              Container(
               width: 250.0,
               alignment: Alignment.bottomLeft,
               child: Text(
                      search.search_title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                ),
                  Container(       width: 250.0,
                     alignment: Alignment.bottomLeft,
                     child: Text(
                          search.release_by,
                          style:
                          TextStyle(color: Colors.grey[900], fontSize: 17),
                          ),
                         )
                      ],)
       
                    ),

                    // SizedBox(width: 15),
                    // TextButton(
                    //   onPressed: () {
                    //     Navigator.pushReplacement(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => RegisterPage()));
                    //   },
                    //   child: (Text(
                    //     '',
                    //     style: TextStyle(
                    //         color: Colors.deepOrange,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 11),
                    //   )),
                    // ),
                    // SizedBox(width: 15),
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
                                  // Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => HomeScreen()));
                                },
                                child: Text(
                                  'Detail',
                                  style: GoogleFonts.jost(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
        ]
      ),
    );
  }
}
       

