import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/edit_akun.dart';
import 'package:sicipe/login_page.dart';
import 'package:sicipe/model/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

class detail_akun extends StatefulWidget {
  final dynamic myProfile;

  detail_akun(this.myProfile);

  @override
  State<detail_akun> createState() => _detail_akunState();
}

class _detail_akunState extends State<detail_akun> {
  var myProfile;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    myProfile = widget.myProfile;
  }

  void logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _onOtherScreenPopped(dynamic result) {
      setState(() {
        if (result != null) {
          myProfile = result;
        }
      });
    }

    return myProfile == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepOrange,
                title: Text('Detail Akun',
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                automaticallyImplyLeading: true,
                leading: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.network(
                        serverBaseURL + myProfile["photo_profile"],
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
                    ),
                  ),
                  new InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => edit_akun(myProfile),
                        ),
                      ).then((result) => _onOtherScreenPopped(result));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 24,
                      ),
                      child: Text(
                        'Ubah Profil Detail',
                        style: GoogleFonts.jost(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          'Nama Pengguna',
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              myProfile['username_pengguna'],
                              style: GoogleFonts.jost(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          'Tanggal Lahir',
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              myProfile['tanggal_lahir'] ?? '-',
                              style: GoogleFonts.jost(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          'Alamat Email',
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              myProfile['alamat_email'],
                              style: GoogleFonts.jost(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.1),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Text(
                          'Nomor Rekening',
                          style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              myProfile['nomor_rekening'] ?? '-',
                              style: GoogleFonts.jost(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            alignment: Alignment.centerRight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.1),
                  new InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text('Konfirmasi Keluar',
                              style: (GoogleFonts.jost(
                                  color: Colors.deepOrange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                          content: Text("Anda ingin keluar dari akun ini?",
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
                                    onPressed: () {
                                      logout();
                                    },
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
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Keluar dari Akun',
                              style: GoogleFonts.jost(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 21,
                            color: Color.fromARGB(255, 207, 203, 203),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(color: Colors.grey, thickness: 0.4),
                ],
              ),
            ),
          );
  }
}
