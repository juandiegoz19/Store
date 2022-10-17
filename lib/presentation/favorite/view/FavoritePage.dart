import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/presentation/favorite/view_model/favorite_vm.dart';
import 'package:store/presentation/utils/widgets/GridViewProduct.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final FavoriteViewModel _favoriteViewModel = FavoriteViewModel();
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridViewProducts(
        listProduct: _favoriteViewModel.shoppingViewModel.likeProducts.value));
  }
}
