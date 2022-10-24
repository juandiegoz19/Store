import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/presentation/main/view_model/main_vm.dart';
import 'package:store/presentation/main/widgets/pages.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MianViewModel _mianViewModel = MianViewModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              _mianViewModel.shoppingCar();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Obx(() => Badge(
                badgeColor: Colors.orange.shade600,
                    showBadge: _mianViewModel
                        .shoppingViewModel.shoppingProductsMap.isNotEmpty,
                    badgeContent: Text(
                        '${_mianViewModel.shoppingViewModel.shoppingProductsMap.length}'),
                    child: const Icon(
                      Icons.local_mall_outlined,
                      size: 30,
                    ),
                  )),
            ),
          ),
        ],
        title: Image.network(
          'https://s22.q4cdn.com/351912490/files/design/Logo-Falabella-Marca_.png',
          width: Get.width * 0.7,
          height: Get.height * 0.2,
          fit: BoxFit.fitHeight,
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _mianViewModel.currentIndex.value,
            enableFeedback: false,
            showUnselectedLabels: false,
            elevation: 0,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            iconSize: 30,
            unselectedItemColor: Colors.grey.shade500,
            selectedItemColor: Colors.black,
            onTap: (value) => _mianViewModel.currentIndex.value = value,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded), label: ''),
            ],
          )),
          backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Obx(() => Pages.page(_mianViewModel.currentIndex.value)),
      ),
    ));
  }
}
