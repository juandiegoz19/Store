import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/search/service/search_service.dart';

class SearchViewModel {
  final SearchService _searchService;
  final TextEditingController controllerSearch = TextEditingController();
  RxMap<int, Products> searchProducts = <int, Products>{}.obs;
  final RxString search = ''.obs;

  SearchViewModel(this._searchService) {
    controllerSearch.addListener(() async {
      if (controllerSearch.text.isEmpty) {
        searchProducts.value = {};
        search.value = '';
      }
    });
  }

  void searchProduct(value) async {
    search.value = '1';
    var list = await _searchService.searchListProducts(value);
    searchProducts.value = list.asMap();
    if(list.isEmpty){
      search.value = 'Not Found Product';
    }
  }
}
