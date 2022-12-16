import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/resep_saya.dart';
import 'package:sicipe/change_password.dart';

class keamanan_akun extends StatefulWidget {
  const keamanan_akun({super.key});

  @override
  State<keamanan_akun> createState() => _keamanan_akunState();
}

class _keamanan_akunState extends State<keamanan_akun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Keamanan Akun',
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 19),
                  child: Text('Ganti Kata Sandi',
                      style: (GoogleFonts.jost(
                          color: Colors.black, fontSize: 16))),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const change_password()),
                      );
                    }),
              ],
            ),
          ),
          Divider(color: Colors.grey, thickness: 0.3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 19),
                child: Text('Ganti Nomor Rekening',
                    style:
                        (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios,
                      size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const resep_saya()),
                    );
                  }),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 19),
                child: Text('Hubungi Kami',
                    style:
                        (GoogleFonts.jost(color: Colors.black, fontSize: 16))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5, left: 19),
                child: Text('admin_sicipe@gmail.com',
                    style:
                        (GoogleFonts.jost(color: Colors.grey, fontSize: 16))),
              ),
            ],
          ),
          Divider(color: Colors.grey, thickness: 0.7),
        ]),
      ),

      // Navigation
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
