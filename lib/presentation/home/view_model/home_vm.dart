import 'dart:async';

import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/home/service/home_service.dart';
import 'package:store/presentation/details/view/DetailPage.dart';
import 'package:store/presentation/shopping/view/ShoppingPage.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';

class HomeViewModel {
  HomeService homeService;
  RxList<String> listCategory = RxList();
  RxList<Products> listProducts = RxList();
  RxInt categorySelect = 0.obs;

  HomeViewModel(this.homeService) {
    Timer(const Duration(seconds: 2), () {
      category();
      products();
    });
  }

  void category() async {
    listCategory.value = await homeService.listCategory();
  }

  void products() async {
    listProducts.value = await homeService.listProducts();
  }

  void categoryProduct(category, position) async {
    categorySelect.value = position;
    listProducts.clear();
    Timer(const Duration(seconds: 1), () async {
      listProducts.value = await homeService.listCategoryProducts(category);
    });
  }

  void detailsProduct(Products products) {
    Get.to(() => DetailPage(), arguments: products);
  }
}
