import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/category_detail.dart';

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
              Navigator.pop(context);
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
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Korea.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Jepang',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Jepang.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Eropa',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Eropa.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Indonesia',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Indonesia.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 2
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Thailand',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Thailand.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'India',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/India.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Vietnam',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hongkong.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hongkong',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hongkong.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 3
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Hidangan Pembuka',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hidangan Pembuka.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hidangan Sampingan',
                    icon: IconButton(
                        icon:
                            Image.asset('assets/icons/Hidangan Sampingan.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hidangan Utama',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hidangan Utama.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hidangan Penutup',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hidangan Penutup.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 4
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Ayam',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Daging Ayam.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sapi',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sapi.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Seafood',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Seafood.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Telur',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Telur.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 4
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Roti',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Roti.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sarapan',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sarapan.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Saus',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Saus.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Mie',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Mie.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 5
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Pedas',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Pedas.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Vegetarian',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Vegetarian.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sayur',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sayur.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sup',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sup.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 6
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Kue Basah',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Kue Basah.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Kue Kering',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Kue Kering.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Makanan Anak',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Makanan Anak.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Makanan Diet',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Makanan Diet.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                ],
              ),

              // Baris 7
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ItemKategoriResep(
                    title: 'Manisan',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Manisan.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Minuman',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Minuman.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Pasta',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Pasta.png'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const category_detail()),
                          );
                        }),
                  ),
                  ItemKategoriResep(
                      title: 'Makanan Pesta',
                      icon: IconButton(
                          icon: Image.asset('assets/icons/Makanan Pesta.png'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail()),
                            );
                          })),
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
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 50,
          child: icon,
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
