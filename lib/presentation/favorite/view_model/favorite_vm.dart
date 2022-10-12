
import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/presentation/details/view/DetailPage.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';

class FavoriteViewModel{
  final ShoppingViewModel shoppingViewModel = Get.find();


  void detailsProduct(Products products){
    Get.to(() => DetailPage(),arguments: products);
  }
}