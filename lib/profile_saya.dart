import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicipe/detail_akun.dart';
import 'package:sicipe/feeds_saya.dart';
import 'package:sicipe/model/auth_services.dart';
import 'package:sicipe/resep_saya.dart';
import 'package:sicipe/keamanan_akun.dart';
import 'package:sicipe/payment.dart';
import 'package:sicipe/withdrawal.dart';
import 'dart:convert';
import 'package:sicipe/model/globals.dart';

class profile_saya extends StatefulWidget {
  const profile_saya({super.key});

  @override
  State<profile_saya> createState() => _profile_sayaState();
}

class _profile_sayaState extends State<profile_saya> {
  var myProfile;

  bool _isInit = true;

  @override
  void initState() {
    super.initState();

    _isInit = true;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_isInit) {
      _isInit = false;
      _asyncMethod();
    }
  }

  _asyncMethod() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String token = prefs.getString('token') ?? "";

    http.Response response = await AuthServices.me(token);
    Map<String, dynamic> decodedData = json.decode(response.body);

    setState(() {
      myProfile = decodedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onOtherScreenPopped(dynamic result) {
      setState(() {
        _isInit = true;
      });
    }

    if (_isInit) {
      _isInit = false;
      _asyncMethod();
    }

    return (myProfile == null || _isInit)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.deepOrange,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Profile Saya',
                  style: GoogleFonts.jost(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_akun(myProfile),
                      ),
                    ).then((result) => _onOtherScreenPopped(result));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.network(
                          serverBaseURL +
                              (myProfile["photo_profile"] != null
                                  ? myProfile["photo_profile"]
                                  : ""),
                          width: 48,
                          height: 48,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Icon(
                              Icons.account_circle_sharp,
                              size: 48,
                              color: Colors.deepOrange,
                            );
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              myProfile["username_pengguna"],
                              style: (GoogleFonts.jost(
                                  color: Colors.black, fontSize: 18)),
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
                Divider(color: Colors.grey, thickness: 0.5),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                'Saldo Saya',
                                style: GoogleFonts.jost(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Rp.' + (myProfile["sisa_saldo"] ?? "0"),
                                style: GoogleFonts.jost(
                                  color: Colors.deepOrange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(95, 33),
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
                                        const PaymentScreen()),
                              );
                            },
                            child: Text(
                              'Top Up',
                              style: GoogleFonts.jost(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(95, 33),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: Colors.deepOrange,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WithdrawScreen()),
                                );
                              },
                              child: Text(
                                'Tarik Saldo',
                                style: GoogleFonts.jost(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.grey, thickness: 0.5),
                new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const resep_saya(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Resep Saya',
                            style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 16,
                            )),
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
                Divider(color: Colors.grey, thickness: 0.5),
                new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FeedsSayaScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Feed Saya',
                            style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 16,
                            )),
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
                Divider(color: Colors.grey, thickness: 0.5),
                new InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const keamanan_akun(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Keamanan Akun',
                            style: (GoogleFonts.jost(
                              color: Colors.black,
                              fontSize: 16,
                            )),
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
                Divider(color: Colors.grey, thickness: 0.5),
              ]),
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
          width: 82,
          height: 28,
          child: Image.asset(
            icon,
          ),
        ),
        SizedBox(
          width: 82,
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
