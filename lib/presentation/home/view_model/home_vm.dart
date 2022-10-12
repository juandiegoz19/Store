import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/home/service/home_service.dart';
import 'package:store/presentation/details/view/DetailPage.dart';
import 'package:store/presentation/shopping/view/ShoppingPage.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';

class HomeViewModel {
  HomeService homeService;
  RxList<String> listCategory = RxList();

  HomeViewModel(this.homeService) {
    category();
  }

  void category() async {
    listCategory.value = await homeService.listCategory();
  }

  Future<List<Products>> products() async {
    return await homeService.listProducts();
  }

  void detailsProduct(Products products){
    Get.to(() => DetailPage(),arguments: products);
  }
 
}
