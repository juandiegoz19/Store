import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/presentation/details/view_model/detail_vm.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});
  final DetailViewModel _detailPage = DetailViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 30,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            Obx(
              () => IconButton(
                icon: Icon(
                  _detailPage.statusLike() ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                  size: 30,
                ),
                onPressed: () {
                  _detailPage.likeAdd();
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, //New
                  blurRadius: 15.0,
                  offset: Offset(0, -1))
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => _detailPage.removeProduct(),
                    icon: const Icon(
                      Icons.remove_circle_outline_rounded,
                      size: 30,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  Obx(() => Text(
                        '${_detailPage.amountProduct.value}',
                        style: const TextStyle(fontSize: 20),
                      )),
                  IconButton(
                    onPressed: () => _detailPage.aggProduct(),
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      size: 30,
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Obx(
                        () => Text(
                          '\$${_detailPage.product.price * _detailPage.amountProduct.value}',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.011),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton(
                  onPressed: () => _detailPage.shpoppingAdd(),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      minimumSize: Size(Get.width, 0),
                      onPrimary: Colors.white,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('Add to card'),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                    tag: _detailPage.product.id,
                    child: Image.network(
                      _detailPage.product.image,
                      height: Get.height * 0.35,
                      width: Get.width,
                      fit: BoxFit.contain,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  _detailPage.product.title,
                  style: TextStyle(
                      fontSize: Get.textScaleFactor * 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '\$${_detailPage.product.price}',
                  style: TextStyle(fontSize: Get.textScaleFactor * 18),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Product Description',
                  style: TextStyle(
                      fontSize: Get.textScaleFactor * 15,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _detailPage.product.description +
                      _detailPage.product.description +
                      _detailPage.product.description,
                  style: TextStyle(fontSize: Get.textScaleFactor * 18),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
