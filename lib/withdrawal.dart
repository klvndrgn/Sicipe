import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sicipe/services/withdraw_services.dart';
import 'package:sicipe/utils/currency.dart';

class WithdrawScreen extends StatefulWidget {
 
  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
  
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String userId = '1';
  String saldo = '';
  late String apiResult;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

  }
  
void withdraw(BuildContext context) async {
  showLoadingIndicator();
  
  final apiResult = await WithdrawServices().withdrawProcess(userId: userId, saldo: saldo.replaceAll(".", ""));
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
    title: "Penarikan Saldo Berhasil",
    desc: "Silahkan Cek Tabungan Anda",
    buttons: [
      DialogButton(
        color: Colors.deepOrange,
        child: Text(
          "Selanjutnya",
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
          'Tarik Saldo',
          style: GoogleFonts.jost(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: 
          isLoading ? CircularProgressIndicator()
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
                        children: [
                          Image.asset('assets/icons/bca.png'),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            child: Text('XXXX XXXX XXXX',
                                style: (GoogleFonts.jost(
                                    color: Colors.deepOrange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25))),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Jumlah Saldo',
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
              'Rp.XXX XXXX',
              style: GoogleFonts.jost(
                  color: Colors.deepOrange,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Penarikan Saldo Minimal Rp10.000',
                textAlign: TextAlign.center,
                style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromARGB(255, 143, 141, 141)),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextField(
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
                      hintText: 'Isi Jumlah Penarikan',
                      hintStyle: TextStyle(
                          color: Colors.grey, fontSize: 15, fontFamily: ''),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    (saldo == null || saldo == "") ? 
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Penarikan Saldo Tidak Boleh Kosong'),
                        duration: Duration(seconds: 3),
                      ),
                    )
                  :
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                              title: Text('Konfirmasi Penarikan Saldo',
                                  style: (GoogleFonts.jost(
                                      color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500))),
                              content: Text(
                                  "Apakah Benar Anda Ingin Melakukan Penarikan Saldo Sebesar Rp. ${saldo} ?",
                                  style: (GoogleFonts.jost(
                                      fontSize: 14))),
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
                                          Navigator.pop(ctx);
                                          withdraw(context);
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
                    'Tarik Saldo',
                    style: GoogleFonts.jost(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

