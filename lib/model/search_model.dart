

import 'package:flutter/cupertino.dart';

class Search{
  final String search_title;
  final String search_url;
  final String release_by;

  const Search({
    required this.search_title,
    required this.search_url, 
    required this.release_by
  });
}

const allSearch = [
  Search(
     search_title: 'Tom Yam Pedas Gurih',
     search_url: 'assets/tom-yam1.jpg',
     release_by: 'Mariz Lauren'
  ),
   Search(
     search_title: 'Tom Yam Goong',
    search_url: 'assets/tom-yam2.jpg',
     release_by: 'Thomas Audin'
  ),
     Search(
     search_title: 'Tom Yam Udang Kampoeng',
     search_url: 'assets/tom-yam3.jpg',
     release_by: 'Dimas Leonardi'
  ),
       Search(
     search_title: 'Tom Yam Udang Seafood',
     search_url: 'assets/tom-yam4.jpg',
     release_by: 'Faiz Iwan'
  ),
        Search(
     search_title: 'Tom Yam Udang Gai',
     search_url: 'assets/tom-yam5.jpg',
     release_by: 'Naufal Zaifal'
  ),
];

