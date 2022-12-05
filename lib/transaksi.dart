import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/recipecategory_page.dart';
import 'package:sicipe/search.dart';

class transaksi extends StatefulWidget {
  const transaksi({super.key});

  @override
  State<transaksi> createState() => _transaksiState();
}

class _transaksiState extends State<transaksi> {
  int _currentIndex = 0;
  int _current = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<dynamic> _trendRecipe = [
    {
      'title': 'Ayam Penyet',
      'image':
          'https://asianfoodnetwork.com/content/dam/afn/global/en/recipes/ayam-penyet/AFN_ayam_penyet_main_image.jpg.transform/recipestep-img/img.jpg'
    },
    {
      'title': 'Tom Yam',
      'image':
          'https://asset.kompas.com/crops/yjf8riNAL8ig7m0uQa-vohWvLNI=/0x5:7360x4912/750x500/data/photo/2021/12/02/61a88dd7b8e1d.jpg'
    },
    {
      'title': 'Nasi Goreng',
      'image':
          'https://www.kitchensanctuary.com/wp-content/uploads/2020/07/Nasi-Goreng-square-FS-57.jpg'
    },
    {
      'title': 'Risol Ayam',
      'image':
          'https://asset.kompas.com/crops/ngoU4gEYBvC42FH0QV-5--6SAgk=/3x0:700x465/780x390/data/photo/2021/01/06/5ff59a5dafb31.jpg'
    },
    {
      'title': 'Martabak Manis',
      'image':
          'https://asset.kompas.com/crops/5u2ge0cWoJj0HOct3B1imjsjbLA=/0x244:800x777/780x390/data/photo/2021/05/23/60a9b166c6503.jpeg'
    },
  ];

  TextEditingController? _textEditingController = TextEditingController();
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(25)),
          child: SizedBox(
            width: 280,
            height: 35,
            child: TextField(
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
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
            ),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 25),
                Text(
                  'Rekomendasi Resep',
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  print(index);
                  setState(() {
                    _current = index;
                  });
                },
                enlargeCenterPage: true,
              ),
              items: _trendRecipe
                  .map((item) => Container(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(_trendRecipe[_current]['image'],
                                      fit: BoxFit.cover, width: 1000.0),
                                  Positioned(
                                    bottom: 0.0,
                                    left: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(200, 0, 0, 0),
                                            Color.fromARGB(0, 0, 0, 0)
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 20.0),
                                      child: Text(
                                        item['title'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _trendRecipe.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.deepOrange)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 25),
                Text(
                  'Kategori Resep',
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 70),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecipeCategory()));
                  },
                  child: (Text(
                    'Tampilkan Semua',
                    style: GoogleFonts.jost(
                        color: Colors.deepOrange,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ItemKategoriResep(
                        title: 'Cemilan',
                        icon: 'assets/icons/Cemilan.png',
                      ),
                      ItemKategoriResep(
                        title: 'Ayam',
                        icon: 'assets/icons/Daging Ayam.png',
                      ),
                      ItemKategoriResep(
                        title: 'Eropa',
                        icon: 'assets/icons/Eropa.png',
                      ),
                      ItemKategoriResep(
                        title: 'Indonesia',
                        icon: 'assets/icons/Indonesia.png',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ItemKategoriResep(
                        title: 'Hidangan Pembuka',
                        icon: 'assets/icons/Hidangan Pembuka.png',
                      ),
                      ItemKategoriResep(
                        title: 'Hidangan Sampingan',
                        icon: 'assets/icons/Hidangan Sampingan.png',
                      ),
                      ItemKategoriResep(
                        title: 'Hidangan Utama',
                        icon: 'assets/icons/Hidangan Utama.png',
                      ),
                      ItemKategoriResep(
                        title: 'Hidangan Penutup',
                        icon: 'assets/icons/Jepang.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemKategoriResep extends StatelessWidget {
  const ItemKategoriResep({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 50,
          child: Image.asset(
            icon,
          ),
        ),
        SizedBox(
          width: 90,
          child: Text(
            title,
            style: GoogleFonts.jost(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
