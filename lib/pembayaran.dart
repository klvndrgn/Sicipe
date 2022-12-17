import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/ganti_nomor_rekening.dart';
import 'package:sicipe/purchased_recipes_detail.dart';

class pembayaran extends StatefulWidget {
  const pembayaran({super.key});

  @override
  State<pembayaran> createState() => _pembayaranState();
}

class _pembayaranState extends State<pembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Pembayaran',
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
            padding: const EdgeInsets.only(left: 28, top: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 0),
                  child: IconButton(
                      icon: Icon(Icons.account_balance_wallet_outlined,
                          size: 61, color: Colors.red),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const pembayaran()),
                        );
                      }),
                ),
                // Image.asset('assets/icons/profile-picture.png'),
                SizedBox(width: 49),
                Container(
                    child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 250.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Saldo Saya',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 250.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Rp 500.000',
                        style: TextStyle(color: Colors.grey[900], fontSize: 17),
                      ),
                    )
                  ],
                )),
                // SizedBox(width: 165),
                // IconButton(
                //     icon: Icon(Icons.arrow_forward_ios,
                //         size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const pembayaran()),
                //       );
                //     }),
              ],
            ),
          ),
          SizedBox(width: 45),
          Padding(
            padding: const EdgeInsets.only(left: 28, top: 35),
            child: Column(
              children: [
                Container(
                    child: Column(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 450.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Ringkasan Pembayaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 20),
                Container(
                    child: Row(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 250.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Resep Cireng',
                        style: TextStyle(color: Colors.grey[800], fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Rp 100.000',
                        style: TextStyle(color: Colors.grey[900], fontSize: 15),
                      ),
                    )
                  ],
                )),
                SizedBox(height: 20),
                Container(
                    child: Row(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: 250.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Resep Sushi Rolls',
                        style: TextStyle(color: Colors.grey[800], fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Rp 300.000',
                        style: TextStyle(color: Colors.grey[900], fontSize: 15),
                      ),
                    )
                  ],
                )),
                SizedBox(height: 240),
                Container(
                    child: Column(
                  children: [
                    // SizedBox(height: 20),
                    Container(
                      width: 450.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Total Tagihan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Container(
                    //   width: 450.0,
                    //   alignment: Alignment.bottomLeft,
                    //   child: Text(
                    //     'Rp 400.000',
                    //     style: TextStyle(
                    //         color: Colors.grey[900], fontSize: 17),
                    //   ),
                    // )
                  ],
                )),
                Container(
                    child: Row(
                  children: [
                    // SizedBox(height: 20),
                    Container(
                      width: 250.0,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Rp 400.000',
                        style: TextStyle(color: Colors.grey[900], fontSize: 17),
                      ),
                    ),
                    SizedBox(height: 10),
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
                                  const PurchasedRecipesDetailScreen()),
                        );
                      },
                      child: Text(
                        'Bayar',
                        style: GoogleFonts.jost(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )),
                // SizedBox(width: 165),
                // IconButton(
                //     icon: Icon(Icons.arrow_forward_ios,
                //         size: 21, color: Color.fromARGB(255, 207, 203, 203)),
                //     onPressed: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const pembayaran()),
                //       );
                //     }),
              ],
            ),
          )
        ]),
      ),

      // Navigation
    );
  }
}
