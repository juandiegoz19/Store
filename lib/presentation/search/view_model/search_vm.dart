import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/search/service/search_service.dart';

class SearchViewModel {
  final SearchService _searchService;
  final TextEditingController controllerSearch = TextEditingController();
  RxMap<int, Products> searchProducts = <int, Products>{}.obs;

  SearchViewModel(this._searchService) {
    controllerSearch.addListener(() async {
      searchProducts.value = {};
      if (controllerSearch.text.isNotEmpty) {
        var list =
            await _searchService.searchListProducts(controllerSearch.text);
        searchProducts.value = list.asMap();
      } else {}
    });
  }
}
