import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/services/payment_services.dart';
import 'package:sicipe/utils/currency.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String userId = '1';
  String saldo = '';
  late String apiResult;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

  }
  void payment(BuildContext context) async {
  showLoadingIndicator();
  
  final apiResult = await PaymentServices().paymentProcess(userId: userId, saldo: saldo.replaceAll(".", ""));
  hideLoadingIndicator();
  
  if (apiResult.isNotEmpty || apiResult != null) {
    showSuccessAlert(context);
  } else {
    showSnackbar(context, apiResult['message']);
  }
  removeSaldoValue();
}
void removeSaldoValue(){
  setState(() {
    saldo = '';
  });
}
void showLoadingIndicator() {
  setState(() {
    isLoading = true;
  });
}

void hideLoadingIndicator() {
  setState(() {
    isLoading = false;
  });
}

void showSuccessAlert(BuildContext context) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "Top Up Anda Segera Di Proses",
    desc: "Silahkan Menunggu Proses Top Upnya",
    buttons: [
      DialogButton(
        color: Colors.deepOrange,
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        onPressed: () => Navigator.pop(context),
      )
    ],
  ).show();
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
        title: Text(
          'Top Up',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: isLoading ? CircularProgressIndicator()
        :
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [Image.asset('assets/icons/bca.png')],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text('Biaya Admin Rp. 1000',
                              style: (GoogleFonts.jost(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Nomor Rekening Virtual',
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Nama Akun: XXX',
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'XXXX XXXX XXXX',
              style: GoogleFonts.jost(
                  color: Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 33),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: Text('Jumlah Saldo Top Up',
                                  style: (GoogleFonts.jost(
                                      color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))),
                              content: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly, 
                                  new LengthLimitingTextInputFormatter(10),
                                  CurrencyFormat()
                                  ],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) => saldo = value,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '1.000',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15, fontFamily: ''),
                                ),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      child: ElevatedButton(
                                        style:
                                            ElevatedButton.styleFrom(
                                          minimumSize: Size(113, 37),
                                          backgroundColor:
                                              Colors.grey,
                                        ),
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text(
                                          'Tidak',
                                          style: GoogleFonts.jost(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: ElevatedButton(
                                        style:
                                            ElevatedButton.styleFrom(
                                          minimumSize: Size(113, 37),
                                          backgroundColor:
                                              Colors.deepOrange,
                                        ),
                                        onPressed: () {
                                            (saldo == null || saldo == "") ? 
                                              ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(
                                                content: Text('Penarikan Saldo Tidak Boleh Kosong'),
                                                duration: Duration(seconds: 3),
                                              ),
                                            )
                                          :
                                          Navigator.pop(ctx);
                                          payment(context);
                                        },
                                        child: Text(
                                          'Iya',
                                          style: GoogleFonts.jost(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight:
                                                  FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]));
                    // Navigator.pop(context);
                    
                  },
                  child: Text(
                    'Salin Nomor',
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Proses verifikasi tidak lebih dari 10 menit setelah pembayaran berhasil',
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    Text(
                      'Petunjuk Pembayaran:',
                      style: GoogleFonts.jost(
                          color: Colors.black,
                          fontSize: 21,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '1. Masuk ke aplikasi m-BCA',
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '2. Pilih m-Transfer -> BCA Virtual Account',
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '3. Masukkan nomor Virtual Account XXXXXXXXXXXX',
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '4. Masukkan jumlah yang ingin di top up',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '5. Periksa tagihan yang tertera sebelum transaksi',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '6. Input pin BCA dan pilih OK',
                        style: GoogleFonts.jost(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
