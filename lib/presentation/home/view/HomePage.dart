import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:store/domain/home/service/home_service.dart';
import 'package:store/infrestructure/home/repository/home_repository.dart';
import 'package:store/presentation/home/view_model/home_vm.dart';
import 'package:store/presentation/utils/widgets/GridViewProduct.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeViewModel _homeViewModel =
      HomeViewModel(HomeService(HomeRepository()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerCarousel(
          spaceBetween: 5,
          disableColor: Colors.orange.shade900,
            animation: false,
            indicatorBottom: false,
            borderRadius: 10,
            margin: const EdgeInsets.all(0),
            height: Get.size.height * 0.2,
            width: Get.size.width,
            customizedIndicators: const IndicatorModel.animation(
                width: 8, height: 8, spaceBetween: 2, widthAnimation: 50),
            banners: [
              BannerModel(
                  imagePath:
                      'https://brandemia.org/contenido/subidas/2021/08/11-falabella-com-1200x670.jpg',
                  id: "1"),
              BannerModel(
                  imagePath:
                      'https://brandemia.org/contenido/subidas/2021/08/11-falabella-com-1200x670.jpg',
                  id: "2"),
              BannerModel(
                  imagePath:
                      'https://brandemia.org/contenido/subidas/2021/08/11-falabella-com-1200x670.jpg',
                  id: "3"),
            ]),
        Container(
          margin: const EdgeInsets.only(top: 30, bottom: 20),
          height: 55,
          child: Obx(() => _homeViewModel.listCategory.isEmpty
              ? Shimmer.fromColors(
                  enabled: _homeViewModel.listCategory.isEmpty,
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.grey.shade300,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Colors.grey, width: 2),
                              )),
                          child: const Text('category'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Colors.grey, width: 2),
                              )),
                          child: const Text('category'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Colors.grey, width: 2),
                              )),
                          child: const Text('category'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(
                                    color: Colors.grey, width: 2),
                              )),
                          child: const Text('category'),
                        ),
                      )
                    ],
                  ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    String category = _homeViewModel.listCategory[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: () =>
                              _homeViewModel.categoryProduct(category, index),
                          style: ElevatedButton.styleFrom(
                              onPrimary:
                                  _homeViewModel.categorySelect.value == index
                                      ? Colors.white
                                      : Colors.black,
                              primary:
                                  _homeViewModel.categorySelect.value == index
                                      ? Colors.black
                                      : Colors.white,
                              padding: const EdgeInsets.all(10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: _homeViewModel.categorySelect.value == index
                                      ? Colors.black
                                      : Colors.grey, width: 2),
                              )),
                          child: Text(category),
                        ),
                      ),
                    );
                  },
                  itemCount: _homeViewModel.listCategory.length,
                  scrollDirection: Axis.horizontal,
                )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'New Arrival',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            InkWell(
              child: Text(
                'See all',
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
        Expanded(
          child: Obx(() => _homeViewModel.listProducts.isEmpty
              ? Shimmer.fromColors(
                  enabled: _homeViewModel.listProducts.isEmpty,
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.grey.shade300,
                  child: GridViewProducts(
                    listProduct: const {},
                    loader: true,
                  ))
              : GridViewProducts(
                  listProduct: _homeViewModel.listProducts.asMap())),
        )
      ],
    );
  }
}
