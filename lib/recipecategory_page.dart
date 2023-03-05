import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/category_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Korea'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Korea')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Jepang',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Jepang.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Jepang'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Jepang')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Eropa',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Eropa.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Eropa'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Eropa')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Indonesia',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Indonesia.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Indonesia'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Indonesia')),
                            );
                          }
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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Thailand'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Thailand')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'India',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/India.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/India'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'India')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Vietnam',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Vietnam.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Vietnam'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Vietnam')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hongkong',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hongkong.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Hongkong'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Hongkong')),
                            );
                          }
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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Hidangan Pembuka'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Hidangan Pembuka')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hidangan Sampingan',
                    icon: IconButton(
                        icon:
                            Image.asset('assets/icons/Hidangan Sampingan.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Hidangan Sampingan'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Hidangan Sampingan')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hidangan Utama',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hidangan Utama.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Hidangan Utama'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Hidangan Utama')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Hidangan Penutup',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Hidangan Penutup.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Hidangan Penutup'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Hidangan Penutup')),
                            );
                          }
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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Daging Ayam'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Daging Ayam')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sapi',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sapi.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Sapi'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Sapi')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Seafood',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Seafood.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Seafood'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Seafood')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Telur',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Telur.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Telur'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Telur')),
                            );
                          }
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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Roti'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Roti')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sarapan',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sarapan.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Sarapan'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Sarapan')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Saus',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Saus.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Saus'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Saus')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Mie',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Mie.png'),
                        onPressed: () async {
                          final response = await http.get(
                              Uri.parse('http://10.0.2.2:8000/api/reseps/Mie'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Mie')),
                            );
                          }
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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Pedas'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Pedas')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Vegetarian',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Vegetarian.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Vegetarian'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Vegetarian')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sayur',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sayur.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Sayur'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Sayur')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Sup',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Sup.png'),
                        onPressed: () async {
                          final response = await http.get(
                              Uri.parse('http://10.0.2.2:8000/api/reseps/Sup'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Sup')),
                            );
                          }
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
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Kue Basah'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Kue Basah')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Kue Kering',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Kue Kering.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Kue Kering'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Kue Kering')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Makanan Anak',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Makanan Anak.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Makanan Anak'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Makanan Anak')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Makanan Diet',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Makanan Diet.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Makanan Diet'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const category_detail(
                                      nama: 'Makanan Diet')),
                            );
                          }
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
                    title: 'Cemilan',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Manisan.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Cemilan'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Cemilan')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Minuman',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Minuman.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Minuman'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Minuman')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                    title: 'Pasta',
                    icon: IconButton(
                        icon: Image.asset('assets/icons/Pasta.png'),
                        onPressed: () async {
                          final response = await http.get(Uri.parse(
                              'http://10.0.2.2:8000/api/reseps/Pasta'));
                          Map<String, dynamic> decodedData =
                              json.decode(response.body);
                          if (decodedData["data"].toString() == "[]") {
                            // Data exists, do something
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Maaf"),
                                  content: Text("Resep belum tersedia"),
                                  actions: [],
                                );
                              },
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const category_detail(nama: 'Pasta')),
                            );
                          }
                        }),
                  ),
                  ItemKategoriResep(
                      title: 'Makanan Pesta',
                      icon: IconButton(
                          icon: Image.asset('assets/icons/Makanan Pesta.png'),
                          onPressed: () async {
                            final response = await http.get(Uri.parse(
                                'http://10.0.2.2:8000/api/reseps/Makanan Pesta'));
                            Map<String, dynamic> decodedData =
                                json.decode(response.body);
                            if (decodedData["data"].toString() == "[]") {
                              // Data exists, do something
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Maaf"),
                                    content: Text("Resep belum tersedia"),
                                    actions: [],
                                  );
                                },
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const category_detail(
                                        nama: 'Makanan Pesta')),
                              );
                            }
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
