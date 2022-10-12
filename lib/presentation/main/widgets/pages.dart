import 'package:flutter/material.dart';
import 'package:store/presentation/favorite/view/FavoritePage.dart';
import 'package:store/presentation/home/view/HomePage.dart';
import 'package:store/presentation/search/view/SearchPage.dart';

class Pages {
  static Widget page(var i) {

    switch (i) {
      case 0:
        return HomePage();
        case 1:
        return SearchPage();
      case 2:
        return FavoritePage();
    }

    return Container();
  }
}
