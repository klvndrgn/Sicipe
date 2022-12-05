import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/home_page.dart';

class RecipeCategory extends StatefulWidget {
  const RecipeCategory({super.key});

  @override
  State<RecipeCategory> createState() => _RecipeCategoryState();
}

class _RecipeCategoryState extends State<RecipeCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Kategori Resep',
            style: GoogleFonts.jost(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: new IconButton(
            padding: EdgeInsets.only(left: 0, right: 0, top: 0),
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Korea',
                    icon: 'assets/icons/Korea.png',
                  ),
                  ItemKategoriResep(
                    title: 'Jepang',
                    icon: 'assets/icons/Jepang.png',
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

              // Baris 2
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

              // Baris 3
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Cemilan',
                    icon: 'assets/icons/Cemilan.png',
                  ),
                  ItemKategoriResep(
                    title: 'Kue',
                    icon: 'assets/icons/Kue-Kuean.png',
                  ),
                  ItemKategoriResep(
                    title: 'Makanan Anak',
                    icon: 'assets/icons/Makanan Anak.png',
                  ),
                  ItemKategoriResep(
                    title: 'Minuman',
                    icon: 'assets/icons/Minuman.png',
                  ),
                ],
              ),

              // Baris 4
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Sarapan',
                    icon: 'assets/icons/Sarapan.png',
                  ),
                  ItemKategoriResep(
                    title: 'Saus',
                    icon: 'assets/icons/Saus.png',
                  ),
                  ItemKategoriResep(
                    title: 'Sayur',
                    icon: 'assets/icons/Sayur.png',
                  ),
                  ItemKategoriResep(
                    title: 'Sup',
                    icon: 'assets/icons/Sup.png',
                  ),
                ],
              ),

              // Baris 5
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Thailand',
                    icon: 'assets/icons/Thailand.png',
                  ),
                  ItemKategoriResep(
                    title: 'Vegetarian',
                    icon: 'assets/icons/Vegetarian.png',
                  ),
                  ItemKategoriResep(
                    title: 'Sayur',
                    icon: 'assets/icons/Sayur.png',
                  ),
                  ItemKategoriResep(
                    title: 'Sup',
                    icon: 'assets/icons/Sup.png',
                  ),
                ],
              ),
            ],
          ),
        ));
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
