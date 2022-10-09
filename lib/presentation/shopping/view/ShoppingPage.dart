import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/presentation/shopping/view_model/shopping_vm.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});
  final ShoppingViewModel _shoppingViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Cart',
            style: TextStyle(
                fontSize: Get.textScaleFactor * 19,
                fontWeight: FontWeight.bold),
          ),
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
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: Get.height * 0.205,
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Subtotal Items(${_shoppingViewModel.shoppingProductsMap.length})',
                      style: TextStyle(fontSize: Get.textScaleFactor * 13),
                    ),
                    Expanded(
                        child: Text(
                      '\$${_shoppingViewModel.subTotal.value.toStringAsFixed(2)}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.textScaleFactor * 16),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Delivery Fee',
                      style: TextStyle(fontSize: Get.textScaleFactor * 13),
                    ),
                    Expanded(
                        child: Text(
                      '\$${_shoppingViewModel.delivery.toStringAsFixed(2)}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.textScaleFactor * 16),
                    )),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: Get.textScaleFactor * 13),
                    ),
                    Expanded(
                        child: Text(
                      '\$${_shoppingViewModel.total.value.toStringAsFixed(2)}',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.textScaleFactor * 16),
                    )),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      minimumSize: Size(Get.width, 0),
                      onPrimary: Colors.white,
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('Go to Payment'),
                ),
              ],
            ),
          ),
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: _shoppingViewModel.shoppingProductsMap.length,
            itemBuilder: (context, index) {
              int key =
                  _shoppingViewModel.shoppingProductsMap.keys.elementAt(index);
              Products products =
                  _shoppingViewModel.shoppingProductsMap[key] as Products;
              //_shoppingViewModel.calculate(products);
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: Get.width,
                child: Row(
                  children: [
                    Image.network(
                      products.image,
                      width: Get.width * 0.18,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(products.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: Get.textScaleFactor * 15))),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.close_rounded))
                          ],
                        ),
                        Row(
                          children: [
                            Text('\$${products.price * products.amount!}',
                                style: TextStyle(
                                    fontSize: Get.textScaleFactor * 15)),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => _shoppingViewModel
                                      .removeProduct(products),
                                  icon: const Icon(
                                    Icons.remove_circle_outline_rounded,
                                    size: 20,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                Text(
                                  '${products.amount!}',
                                  style: const TextStyle(fontSize: 15),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      _shoppingViewModel.aggProduct(products),
                                  icon: const Icon(
                                    Icons.add_circle_rounded,
                                    size: 20,
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ))
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
