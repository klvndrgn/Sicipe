import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sicipe/resep_saya.dart';

class edit_resep extends StatefulWidget {
  final int id;
  const edit_resep({required this.id});
  @override
  State<edit_resep> createState() => _edit_resepState();
}

class _edit_resepState extends State<edit_resep> {
  // String _selectedCategory = '';

  Map<String, String> _categories = {
    'Korea': 'Korea',
    'Jepang': 'Jepang',
    'Eropa': 'Eropa',
    'Indonesia': 'Indonesia',
    'Thailand': 'Thailand',
    'India': 'India',
    'Vietnam': 'Vietnam',
    'Hongkong': 'Hongkong',
    'Hidangan Pembuka': 'Hidangan Pembuka',
    'Hidangan Sampingan': 'Hidangan Sampingan',
    'Hidangan Utama': 'Hidangan Utama',
    'Hidangan Penutup': 'Hidangan Penutup',
    'Ayam': 'Ayam',
    'Sapi': 'Sapi',
    'Seafood': 'Seafood',
    'Telur': 'Telur',
    'Roti': 'Roti',
    'Sarapan': 'Sarapan',
    'Saus': 'Saus',
    'Mie': 'Mie',
    'Pedas': 'Pedas',
    'Vegetarian': 'Vegetarian',
    'Sayur': 'Sayur',
    'Sup': 'Sup',
    'Kue Basah': 'Kue Basah',
    'Kue Kering': 'Kue Kering',
    'Makanan Anak': 'Makanan Anak',
    'Makanan Diet': 'Makanan Diet',
    'Cemilan': 'Cemilan',
    'Minuman': 'Minuman',
    'Pasta': 'Pasta',
    'Makanan Pesta': 'Makanan Pesta',
  };

  Map<String, String> _level = {
    'Easy': 'Easy',
    'Mid': 'Mid',
    'Hard': 'Hard',
  };
  List<String> _selectedCategories = [];
  String? _selectedCategory;
  String? _selectedLevel;

  File? _image;
  String kalori = "";
  String nama = "";
  String durasi = "";
  String harga = "";
  String deskripsi = "";
  String bahan = "";
  String langkah = "";

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final directory = await getApplicationDocumentsDirectory();
      int currentId = int.parse(widget.id.toString());
      // currentId++; // Increment the current ID
      String newId = currentId.toString();
      final file = File('${directory.path}/my_image' + newId + '.png');
      await file.writeAsBytes(bytes);

      setState(() {
        _image = file;
      });
      print(_image);
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
  void initState() {
    super.initState();
    getData();
  }

  List<dynamic> _data = [];

  void getData() {
    http
        .get(
            Uri.parse('http://10.0.2.2:8000/api/resep/' + widget.id.toString()))
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = json.decode(response.body);
        setState(() {
          _data.add(decodedData["data"]);
        });
        print('hallo');
        print(_data[0]);
        KaloriController.text = _data[0]["jumlah_kalori"].toString();
        NamaController.text = _data[0]["nama_resep"].toString();
        DurasiController.text = _data[0]["durasi_masak"].toString();
        HargaController.text = _data[0]["harga_resep"].toString();
        DeskripsiController.text = _data[0]["deskripsi_resep"].toString();
        BahanController.text = _data[0]["bahan_dan_alat"].toString();
        LangkahController.text = _data[0]["cara_kerja"].toString();
        _selectedLevel = _data[0]["level"].toString();
        String originalString =
            "Hidangan Pembuka, Hidangan Sampingan, Hongkong";
        List<String> splitValues = originalString.split(", ");
        for (String selectedValue in splitValues) {
          _selectedCategories.add(selectedValue);
        }

        // _selectedCategories
        //     .addAll(["Hidangan Pembuka", "Hidangan Sampingan", "Hongkong"]);

        // _selectedCategories.addAll(_data[0]["nama_kategori_resep"]);
        // _getImagePath();
      } else {
        throw Exception('Failed to load data');
      }
    });
  }

  final url = 'http://10.0.2.2:8000/api/resep/';

  final KaloriController = TextEditingController();
  final NamaController = TextEditingController();
  final DurasiController = TextEditingController();
  final HargaController = TextEditingController();
  final DeskripsiController = TextEditingController();
  final BahanController = TextEditingController();
  final LangkahController = TextEditingController();

  Future<void> submitData(BuildContext context) async {
    // final kategori = KategoriController.text.trim();
    kalori = KaloriController.text.trim();
    nama = NamaController.text.trim();
    durasi = DurasiController.text.trim();
    harga = HargaController.text.trim();
    deskripsi = DeskripsiController.text.trim();
    bahan = BahanController.text.trim();
    langkah = LangkahController.text.trim();

    List<String> emptyFields = [];

    // if (_image == null) {
    //   emptyFields.add('Foto Makanan');
    // }

    if (_selectedCategories == "") {
      emptyFields.add('Kategori Resep');
    }

    if (nama.isEmpty) {
      emptyFields.add('Nama Resep');
    }

    if (_selectedLevel == null || _selectedLevel == "") {
      emptyFields.add('Level');
    }

    if (kalori.isEmpty) {
      emptyFields.add('Jumlah Kalori');
    }

    if (durasi.isEmpty) {
      emptyFields.add('Durasi Masak');
    }

    if (harga.isEmpty) {
      emptyFields.add('Harga Resep');
    }

    if (deskripsi.isEmpty) {
      emptyFields.add('Deskripsi Makanan');
    }

    if (bahan.isEmpty) {
      emptyFields.add('Bahan & Alat');
    }

    // if (alat.isEmpty) {
    //   emptyFields.add('Alat');
    // }

    if (langkah.isEmpty) {
      emptyFields.add('Langkah-langkah');
    }

    if (emptyFields.isNotEmpty) {
      // Show an error message indicating which fields are required
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Validate"),
            content: Text(
                "The following fields are required: ${emptyFields.join(", ")}"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    int currentId = int.parse(widget.id.toString());
    // currentId++; // Increment the current ID
    String newId = currentId.toString();
    final data = {
      "id_pengguna": 1,
      "id_kategori_resep": 1,
      "nama_kategori_resep": _selectedCategories.toString(),
      "nama_resep": nama.toString(),
      "harga_resep": int.parse(harga),
      "bahan_dan_alat": bahan.toString(),
      "cara_kerja": langkah.toString(),
      "level": _selectedLevel.toString(),
      "durasi_masak": durasi.toString(),
      "jumlah_kalori": kalori.toString(),
      "deskripsi_resep": deskripsi.toString(),
      "foto_resep": "my_image" + newId.toString() + ".png"
    };
    final url = 'http://10.0.2.2:8000/api/resep/' + widget.id.toString();
    print(url);
    final response = await http.put(
      Uri.parse(url),
      body: json.encode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // The API call was successful, do something with the response
      print('1');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("updated successful"),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to the resep_saya page after saving the data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const resep_saya()),
      );
    } else {
      print('2');
      print(response.reasonPhrase);
      // There was an error, do something to handle it
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_data.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: Text('Penambahan Resep',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              automaticallyImplyLeading: true,
              leading: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: <Widget>[
                  if (_image != null)
                    Image.file(_image!,
                        height: 200,
                        width: 200,
                        cacheWidth: null,
                        cacheHeight: null)
                  else
                    Positioned(
                      right: 20,
                      child: Hero(
                        tag: 'assets/tomyam.png',
                        child: FutureBuilder<String>(
                          future: _getImagePath(_data[0]["foto_resep"]),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.hasData) {
                              _imagePath = snapshot.data!;
                              return Container(
                                  height: 260,
                                  width: 260,
                                  margin: EdgeInsets.only(right: 15),
                                  child: Container(
                                      height: 260,
                                      width: 260,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(width: 4),
                                          image: DecorationImage(
                                              image:
                                                  FileImage(File(_imagePath)),
                                              fit: BoxFit.fitHeight))));
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                    ),

                  SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Gallery'),
                                  onTap: () {
                                    _getImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt),
                                  title: Text('Camera'),
                                  onTap: () {
                                    _getImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.add_a_photo),
                    label: Text('Tambahkan Foto Makanan'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Kategori Resep',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text(
                              _selectedCategories.isNotEmpty
                                  ? ''
                                  : 'Pilih Kategori Resep', // Replace with your desired hint text
                              style: TextStyle(
                                color:
                                    Colors.grey, // Set the color of hint text
                              ),
                            ),
                            Expanded(
                              child: Wrap(
                                children:
                                    _selectedCategories.map((selectedCategory) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Chip(
                                      label: Text(selectedCategory),
                                      onDeleted: () {
                                        setState(() {
                                          _selectedCategories
                                              .remove(selectedCategory);
                                        });
                                      },
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down),
                              itemBuilder: (BuildContext context) {
                                return _categories.entries.map((category) {
                                  return PopupMenuItem<String>(
                                    value: category.value,
                                    child: Text(category.key),
                                  );
                                }).toList();
                              },
                              onSelected: (String? selectedValue) {
                                setState(() {
                                  if (selectedValue != null) {
                                    if (!_selectedCategories
                                        .contains(selectedValue)) {
                                      _selectedCategories.add(selectedValue);
                                      print(_selectedCategories);
                                      print(selectedValue);
                                    }
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Level',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: DropdownButton<String>(
                          value: _selectedLevel,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedLevel = newValue;
                            });
                          },
                          items: _level.entries.map((level) {
                            return DropdownMenuItem<String>(
                              value: level.value,
                              child: Text(level.key),
                            );
                          }).toList(),
                          hint: Text(
                            'Pilih Level',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontFamily: '',
                            ),
                          ),
                          isExpanded: true,
                          underline: Container(),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Resep',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: NamaController,
                          maxLength: 13,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Kurang dari 13 kata',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Jumlah Kalori (Kal)',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          controller: KaloriController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Diisi dengan angka',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Durasi Masak (Menit))',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          controller: DurasiController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Diisi dengan angka',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Harga Resep',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          controller: HargaController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Diisi dengan angka',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Deskripsi Makanan',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: DeskripsiController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Kurang dari 25 kata',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Bahan & Alat',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: BahanController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Ditulis dengan pemisah tanda , Contoh: Bawang Merah,Kunyit,Jamur',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 10.0,
                  //     left: 22,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Alat',
                  //         style:
                  //             GoogleFonts.jost(color: Colors.black, fontSize: 16),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       border:
                  //           Border.all(color: Color.fromARGB(255, 143, 141, 141)),
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(left: 20.0),
                  //       child: TextField(
                  //         keyboardType: TextInputType.multiline,
                  //         maxLines: 4,
                  //         decoration: InputDecoration(
                  //             border: InputBorder.none,
                  //             hintText:
                  //                 'Ditulis dengan pemisah tanda , Contoh: Rebus air selama 3 menit,Tuangkan bumbu kedalam air yang telah mendidih',
                  //             hintStyle: TextStyle(
                  //                 color: Colors.grey,
                  //                 fontSize: 15,
                  //                 fontFamily: '')),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      left: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Langkah - Langkah',
                          style: GoogleFonts.jost(
                              color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Color.fromARGB(255, 143, 141, 141)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: LangkahController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 8,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Ditulis dengan pemisah tanda , Contoh: Rebus air selama 3 menit,Tuangkan bumbu kedalam air yang telah mendidih',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: '')),
                        ),
                      ),
                    ),
                  ),

                  // Password Field

                  // Button Masuk

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () => {submitData(context)},
                        child: Text(
                          'Konfirmasi',
                          style: GoogleFonts.jost(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),

                  // Footer
                ],
              ),
            ),
          ));
    }
  }
}
