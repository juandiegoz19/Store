

import 'package:get/get.dart';
import 'package:store/presentation/shopping/view/ShoppingPage.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';

class MianViewModel{
  final ShoppingViewModel shoppingViewModel = Get.put(ShoppingViewModel());
  RxInt currentIndex = 0.obs;

  void shoppingCar(){
    Get.to(() => ShoppingPage());
  }
}