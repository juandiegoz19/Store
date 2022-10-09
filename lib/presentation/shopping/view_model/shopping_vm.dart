import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';

class ShoppingViewModel extends GetxController {
  //final shoppingProductsMap = {}.obs;
  RxMap<int, Products> shoppingProductsMap = <int, Products>{}.obs;
  RxMap<int, Products> likeProducts = <int, Products>{}.obs;
  RxDouble subTotal = 0.0.obs;
  RxDouble delivery = 100.0.obs;
  RxDouble total = 0.0.obs;

  ShoppingViewModel();

  calculate() {
    subTotal.value = 0;
    total.value = 0;
    shoppingProductsMap.forEach((key, products) {
      subTotal.value += products.price * products.amount!;
    });
    total.value = subTotal.value + delivery.value;
  }

  void removeProduct(Products products) {
    products.amount = products.amount! - 1;
    shpoppingAdd(products);
  }

  void aggProduct(Products products) {
    products.amount = products.amount! + 1;
    shpoppingAdd(products);
  }

  shpoppingAdd(Products product) {
    if (shoppingProductsMap.containsKey(product.id)) {
      shoppingProductsMap.update(product.id, (value) => product);
    } else {
      shoppingProductsMap[product.id] = product;
    }

    calculate();
  }
}
