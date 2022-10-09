import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';

class DetailViewModel {
  final Products product = Get.arguments;
  RxInt amountProduct = 0.obs;
  ShoppingViewModel _shoppingViewModel = Get.find();

  DetailViewModel() {
    validarAmountShopping();
  }

  void removeProduct() {
    amountProduct--;
  }

  void aggProduct() {
    amountProduct++;
  }

  void shpoppingAdd() {
    product.amount = amountProduct.value;
    _shoppingViewModel.shpoppingAdd(product);
  }

  void likeAdd() {
    if (_shoppingViewModel.likeProducts.containsKey(product.id)) {
      _shoppingViewModel.likeProducts.remove(product.id);
    } else {
      _shoppingViewModel.likeProducts[product.id] = product;
    }
  }

  void validarAmountShopping() {
    if (_shoppingViewModel.shoppingProductsMap.containsKey(product.id)) {
      amountProduct.value = _shoppingViewModel.shoppingProductsMap[product.id]?.amount ?? 0;
    } 
  }

  bool statusLike() {
    return _shoppingViewModel.likeProducts.containsKey(product.id);
  }
}
