import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/home/service/home_service.dart';
import 'package:store/infrestructure/home/repository/home_repository.dart';
import 'package:store/presentation/home/view_model/home_vm.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeViewModel _homeViewModel =
      HomeViewModel(HomeService(HomeRepository()));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                _homeViewModel.shoppingCar();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Obx(() => Badge(
                      showBadge: _homeViewModel
                          .shoppingViewModel.shoppingProductsMap.isNotEmpty,
                      badgeContent: Text(
                          '${_homeViewModel.shoppingViewModel.shoppingProductsMap.length}'),
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
            fit: BoxFit.scaleDown,
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            children: [
              BannerCarousel(
                  animation: false,
                  indicatorBottom: false,
                  borderRadius: 10,
                  margin: const EdgeInsets.all(0),
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
                child: Obx((() => ListView.builder(
                      itemBuilder: (context, index) {
                        String category = _homeViewModel.listCategory[index];
                        return Padding(
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
                            child: Text(category),
                          ),
                        );
                      },
                      itemCount: _homeViewModel.listCategory.length,
                      scrollDirection: Axis.horizontal,
                    ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'New Arrival',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: _homeViewModel.products(),
                  builder: (context, AsyncSnapshot<List<Products>> snapshot) {
                    Widget widget =
                        const Center(child: CircularProgressIndicator());

                    if (snapshot.hasData) {
                      widget = GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          crossAxisCount: 2,
                        ),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          Products products = snapshot.data![index];
                          return Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              onTap: () =>
                                  _homeViewModel.detailsProduct(products),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Hero(
                                        tag: products.id,
                                        child: Image.network(
                                          products.image,
                                          width: double.infinity,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      products.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Get.textScaleFactor * 15),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text('\$${products.price}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return widget;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
