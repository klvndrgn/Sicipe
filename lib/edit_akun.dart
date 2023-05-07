import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:sicipe/model/auth_services.dart';
import 'package:sicipe/model/globals.dart';

class edit_akun extends StatefulWidget {
  final dynamic myProfile;

  edit_akun(this.myProfile);

  @override
  State<edit_akun> createState() => _edit_akunState();
}

class _edit_akunState extends State<edit_akun> {
  bool isAlreadyUploadProfile = false;
  var setter;

  String _date = "";
  String _email = "";
  String _name = "";
  String _initImage = "";
  String? _imagePath;

  TextEditingController _nameInputController = new TextEditingController();
  TextEditingController _dateInputController = new TextEditingController();
  TextEditingController _emailInputController = new TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();

    _nameInputController.text = widget.myProfile['username_pengguna'] ?? "";
    _dateInputController.text = widget.myProfile['tanggal_lahir'] ?? "";
    _emailInputController.text = widget.myProfile['alamat_email'] ?? "";

    _date = widget.myProfile['tanggal_lahir'] ?? "";
    _email = widget.myProfile['alamat_email'] ?? "";
    _name = widget.myProfile['username_pengguna'] ?? "";
    _initImage = serverBaseURL + widget.myProfile["photo_profile"];
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width.toDouble();

    editAccountPressed() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      final String token = prefs.getString('token') ?? "";

      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_email);

      Navigator.pop(context, true);

      if (emailValid) {
        if (_name != '') {
          if (_date != '') {
            http.Response response = await AuthServices.editAccount(
                token, _name, _email, _date, _imagePath);
            Map responseMap = jsonDecode(response.body);

            if (response.statusCode == 200) {
              Navigator.pop(context, responseMap["data"]);
            } else {
              errorSnackBar(context, responseMap.values.first[0]);
            }
          } else {
            errorSnackBar(context, 'Tanggal lahir tidak boleh kosong');
          }
        } else {
          errorSnackBar(context, 'Nama tidak boleh kosong');
        }
      } else {
        errorSnackBar(context, 'Email tidak valid');
      }
    }

    print(_imagePath);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text(
            'Edit Akun',
            style: GoogleFonts.jost(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: true,
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FormBuilder(
                key: _formKey,
                child: FormBuilderFilePicker(
                  name: 'images',
                  maxFiles: null,
                  allowMultiple: true,
                  previewImages: true,
                  onChanged: (val) {
                    debugPrint(val.toString());

                    setState(() {
                      isAlreadyUploadProfile = true;
                      _imagePath = val != null ? val[0].path : "";
                    });
                  },
                  typeSelectors: [
                    TypeSelector(
                      type: FileType.any,
                      selector: Container(
                        width: screenWidth - 20,
                        child: !isAlreadyUploadProfile
                            ? Column(
                                children: [
                                  Image.network(
                                    _initImage,
                                    width: 86,
                                    height: 86,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Icon(
                                        Icons.account_circle_sharp,
                                        size: 86,
                                        color: Colors.deepOrange,
                                      );
                                    },
                                  ),
                                  Text(
                                    "Klik untuk mengubah foto profile",
                                    style: GoogleFonts.jost(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ),
                    ),
                  ],
                  onFileLoading: (val) {
                    debugPrint(val.toString());
                  },
                  customFileViewerBuilder: (files, filesSetter) =>
                      customFileViewerBuilder(files ?? [], (newValue) {}),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10, top: 10),
                    child: Text(
                      'Nama Pengguna',
                      style: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                        controller: _nameInputController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Nama Pengguna',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: '',
                          ),
                        ),
                        onChanged: (value) {
                          _name = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      'Tanggal Lahir',
                      style: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                        readOnly: true,
                        controller: _dateInputController,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2101),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            _date = formattedDate;

                            setState(() {
                              _dateInputController.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Tanggal Lahir',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: '',
                          ),
                          suffixIcon:
                              Icon(Icons.calendar_today, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      'Alamat Email',
                      style: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                        controller: _emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Masukkan Alamat Email',
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 15, fontFamily: ''),
                        ),
                        onChanged: (value) {
                          _email = value;
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text('Konfirmasi Edit Akun',
                            style: (GoogleFonts.jost(
                                color: Colors.deepOrange,
                                fontSize: 18,
                                fontWeight: FontWeight.w500))),
                        content: Text(
                            "Anda yakin ingin, mengubah detail dari akun ini?",
                            style: (GoogleFonts.jost(fontSize: 14))),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(113, 37),
                                    backgroundColor: Colors.grey,
                                  ),
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Text(
                                    'Tidak',
                                    style: GoogleFonts.jost(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Container(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(113, 37),
                                    backgroundColor: Colors.deepOrange,
                                  ),
                                  onPressed: editAccountPressed,
                                  child: Text(
                                    'Iya',
                                    style: GoogleFonts.jost(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Edit Akun',
                    style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customFileViewerBuilder(
    List<PlatformFile> files,
    FormFieldSetter<List<PlatformFile>> setter,
  ) {
    String pathName = files.isEmpty ? "" : (files[0].path ?? "");

    return !isAlreadyUploadProfile
        ? SizedBox()
        : Column(
            children: [
              Image.file(
                File(pathName),
                width: 86,
                height: 86,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Icon(
                    Icons.account_circle_sharp,
                    size: 86,
                    color: Colors.deepOrange,
                  );
                },
              ),
              new InkWell(
                onTap: () {
                  setState(() {
                    isAlreadyUploadProfile = false;
                  });
                  files.removeAt(0);
                  setter.call([...files]);

                  setState(() {
                    _imagePath = null;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                  child: Text(
                    "Batal",
                    style: GoogleFonts.jost(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
