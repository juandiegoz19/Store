import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/presentation/details/view/DetailPage.dart';

class GridViewProducts extends StatelessWidget {
  const GridViewProducts({super.key, required this.listProduct, this.loader = false});

  final Map listProduct;
  final bool loader;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        cacheExtent: 99.9999999999,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: GetPlatform.isDesktop ? 5 : 2,
        ),
        itemCount: loader ? 10 : listProduct.length,
        itemBuilder: (context, index) {
          if (!loader) {
            int key = listProduct.keys.elementAt(index);
            Products products = listProduct[key] as Products;
            return Card(
              elevation: 5,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  Get.to(() => DetailPage(), arguments: products);
                },
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
          } else {
            return const Card(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
            );
          }
        });
  }
}
