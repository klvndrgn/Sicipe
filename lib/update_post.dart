import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/feeds_page.dart';
import 'package:sicipe/services/feed_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class UpdatePostScreen extends StatefulWidget {
  final Map feedData;
  UpdatePostScreen({Key? key, required this.feedData}) : super(key: key);

  @override
  _UpdatePostScreenState createState() => _UpdatePostScreenState();
}

class _UpdatePostScreenState extends State<UpdatePostScreen> {
  List resepData = [];
  File? _image;
  String? _imagePath;
  String? _selectedResep;
  final directory = getApplicationDocumentsDirectory();

  final DeskripsiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDropdownResep();
    initAsyncState();
  }

  Future<void> initAsyncState() async {
    DeskripsiController.text = widget.feedData['deskripsi_feeds'];
    _selectedResep = widget.feedData['id_resep'].toString();
    _imagePath = widget.feedData['foto_feeds'];

    if (_imagePath != null) {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$_imagePath');
      if (await file.exists()) {
        setState(() {
          _image = file;
        });
      }
    }
  }
  
  void fetchDropdownResep() async{
    final resepDropdown = await FeedServices().fetchDropdownResep();

    if (resepDropdown.statusCode == 200) {
        final responseJson = json.decode(resepDropdown.body);
        setState(() {
          resepData = responseJson['data'] as List;
        });
        print('Resep : $resepData');
      } else {
        showSnackbar(context, resepDropdown.body['message']);
      }
  }
  String generateUniqueNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(1000);
    int timeStamp = DateTime.now().microsecondsSinceEpoch;
    return '$timeStamp$randomNumber';
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final directory = await getApplicationDocumentsDirectory();
      final imageName = 'my_image' + generateUniqueNumber() + '.png';
      final file = File('${directory.path}/' + imageName);
      await file.writeAsBytes(bytes);

      setState(() {
        _image = file;
        _imagePath = imageName;
      });
    }
  }
  Future<void> submitData(BuildContext context) async {
    final deskripsi = DeskripsiController.text.trim();

    List<String> emptyFields = [];

    if (_image == null) {
      emptyFields.add('Foto Makanan');
    }

    if (_selectedResep == null || _selectedResep == "") {
      emptyFields.add('Kategori Resep');
    }

    if(deskripsi.isEmpty) {
      emptyFields.add('Deskripsi');
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
    DateTime now = DateTime.now();
    final data = {
      "id_pengguna": widget.feedData['id_feeds'],
      "nama_pengguna": 'Sicipe Creator',
      "id_resep": _selectedResep.toString(),
      "deskripsi_feeds": deskripsi.toString(),
      "tanggal_feeds" : now.toString(),
      "foto_feeds": _imagePath.toString()
    };

    final response = await FeedServices().updateFeed(id: widget.feedData['id_feeds'],data: data);
    if (response.statusCode == 200) {
      // The API call was successful, do something with the response
      print('1');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Update successful"),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate to the resep_saya page after saving the data
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => FeedScreen()),
      );
    } else {
      print('2');
      print(response.reasonPhrase);
      // There was an error, do something to handle it
    }
  }
  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.deepOrange,
            title: Text('Update Postingan',
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
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: <Widget>[
                if (_image != null)
                  Image.file(
                    _image!,
                    height: 200,
                    width: 200,
                  )
                else
                  Image.asset(
                    'assets/icons/gambar_tambah_resep.png',
                    height: 200,
                    width: 200,
                  ),
                SizedBox(height: 5),
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
                // Username Field
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 22),
                  child: Row(
                    children: [
                      Text(
                        'Resep Makanan',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 16),
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
                      border:
                          Border.all(color: Color.fromARGB(255, 143, 141, 141)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                        child: DropdownButton<String>(
                        value: _selectedResep,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedResep = newValue;
                            print('selected resep :'+_selectedResep.toString());
                          });
                        },
                        items: resepData.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['id_resep'].toString(),
                            child: Text(item['nama_resep']),
                          );
                        }).toList(),
                        hint: Text(
                          'Pilih Kategori',
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
                        'Deskripsi',
                        style:
                            GoogleFonts.jost(color: Colors.black, fontSize: 16),
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
                      border:
                          Border.all(color: Color.fromARGB(255, 143, 141, 141)),
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

                // Button Konfirmasi

                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(500, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        submitData(context);
                      },
                      child: Text(
                        'Update',
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
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
