import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicipe/services/feed_services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sicipe/update_post.dart';

class FeedsSayaScreen extends StatefulWidget {
  const FeedsSayaScreen({super.key});

  @override
  State<FeedsSayaScreen> createState() => _FeedsSayaScreenState();
}

class _FeedsSayaScreenState extends State<FeedsSayaScreen> {
  int page = 1;
  List feedData = [];
  String _imagePath = '';

  bool isFav = false;

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    fetch(context);
  }

  void fetch(BuildContext context) async {
    showLoadingIndicator();

    final apiResult = await FeedServices().fetchFeed(page: page);
    hideLoadingIndicator();

    if (apiResult.statusCode == 200) {
      setState(() {
        feedData = jsonDecode(apiResult.body);
      });
      print('feeds : $feedData');
    } else {
      showSnackbar(context, apiResult.body['message']);
    }
  }

  void delete(int id) async {
    showLoadingIndicator();

    final apiResult = await FeedServices().deleteFeed(id: id);
    hideLoadingIndicator();

    if (apiResult.statusCode == 200) {
      feedData.removeWhere((feed) => feed["id_feeds"] == id);
      showSnackbar(context, 'Delete Succesful');
    } else {
      showSnackbar(context, apiResult.body);
    }
  }

  Future<String> _getImagePath(imagesource) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = imagesource;
    final path = '${directory.path}/$fileName';
    setState(() {
      _imagePath = path;
    });
    return _imagePath;
  }

  // void _scrollListener() {
  //   if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
  //     print('Fetch Data');
  //   }else{
  //     print('Dont Fetch data');
  //   }
  // }
  String formatDateTime(DateTime dateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} Minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} Hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} Days ago';
    } else if (difference.inDays < 30) {
      int weeks = (difference.inDays / 7).floor();
      return '$weeks ${weeks == 1 ? 'Week' : 'Weeks'} ago';
    } else if (difference.inDays < 365) {
      int months = (difference.inDays / 30).floor();
      return '$months ${months == 1 ? 'Month' : 'Months'} ago';
    } else {
      int years = (difference.inDays / 365).floor();
      return '$years ${years == 1 ? 'Year' : 'Years'} ago';
    }
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
          title: Text('Feeds Saya',
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : feedData.isEmpty
              ? Center(child: Text('Tidak ada Data'))
              : ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: feedData.length,
                  // controller: scrollController,
                  itemBuilder: (context, index) {
                    final data = feedData[index];
                    final idFeed = data['id_feeds'];
                    final idPengguna = data['id_pengguna'];
                    final idResep = data['id_resep'];
                    final fotoFeed = data['foto_feeds'];
                    final komentar = data['komentar'];
                    final deskripsi = data['deskripsi_feeds'];
                    final namaPengguna = data['nama_pengguna'];
                    final namaResep = data['nama_resep'];
                    final tanggal = data['tanggal_feeds'];

                    DateTime dateTime =
                        DateTime.parse(tanggal).add(Duration(hours: 7));

                    return SizedBox(
                      height: 420,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 400.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(0, 2),
                                  blurRadius: 8.0),
                            ],
                          ),
                          child: Column(children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Container(
                                      margin: EdgeInsets.all(9.0),
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black45,
                                              offset: Offset(0, 2),
                                              blurRadius: 6.0,
                                            ),
                                          ]),
                                      child: CircleAvatar(
                                        child: ClipOval(
                                          child: Image(
                                            height: 40.0,
                                            width: 40.0,
                                            image: AssetImage(
                                                'assets/icons/profile-picture.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      '$namaPengguna',
                                      style: GoogleFonts.jost(
                                          color: Colors.black, fontSize: 14),
                                    ),
                                    subtitle: Text(
                                      formatDateTime(new DateTime.now()),
                                      style: GoogleFonts.jost(
                                          color: Colors.grey.shade400,
                                          fontSize: 10),
                                    ),
                                    trailing: PopupMenuButton(
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          PopupMenuItem(
                                            value: 'edit',
                                            child: Text('Edit'),
                                          ),
                                          PopupMenuItem(
                                            value: 'delete',
                                            child: DefaultTextStyle(
                                              style:
                                                  TextStyle(color: Colors.red),
                                              child: Text('Delete'),
                                            ),
                                          ),
                                        ];
                                      },
                                      onSelected: (value) {
                                        if (value == 'edit') {
                                          // Perform the edit action
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      UpdatePostScreen(
                                                        feedData: {
                                                          "id_feeds": idFeed,
                                                          "id_resep": idResep,
                                                          "id_pengguna":
                                                              idPengguna,
                                                          "deskripsi_feeds":
                                                              deskripsi,
                                                          "foto_feeds": fotoFeed
                                                        },
                                                      )));
                                        } else if (value == 'delete') {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title:
                                                    Text('Delete Confirmation'),
                                                content: Text(
                                                    'Are you sure you want to delete this item?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(false),
                                                    child: Text('CANCEL'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                    child: Text('DELETE'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ).then((value) {
                                            if (value != null && value) {
                                              // Perform the delete operation here
                                              delete(idFeed);
                                            }
                                          });
                                        }
                                      },
                                      icon: Icon(Icons.more_horiz),
                                      // color: Colors.deepOrange,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 15, right: 15, bottom: 5),
                                          child: Text(
                                            '$deskripsi',
                                            style: GoogleFonts.jost(
                                                color: Colors.black,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  FutureBuilder<String>(
                                    future: _getImagePath(fotoFeed),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<String> snapshot) {
                                      if (snapshot.hasData) {
                                        return Container(
                                          margin: EdgeInsets.zero,
                                          width: double.infinity,
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: FileImage(
                                                  File(snapshot.data!)),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        );
                                      } else {
                                        return CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isFav = !isFav;
                                                      print(
                                                          "Button Favorite : $isFav");
                                                    });
                                                  },
                                                  icon: isFav
                                                      ? Icon(Icons.favorite,
                                                          color:
                                                              Colors.redAccent)
                                                      : Icon(Icons
                                                          .favorite_border))
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.comment_outlined))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
