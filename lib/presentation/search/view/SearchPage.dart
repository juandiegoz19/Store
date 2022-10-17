import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/domain/home/service/home_service.dart';
import 'package:store/domain/search/service/search_service.dart';
import 'package:store/infrestructure/home/repository/home_repository.dart';
import 'package:store/infrestructure/search/repository/search_repository.dart';
import 'package:store/presentation/search/view_model/search_vm.dart';
import 'package:store/presentation/utils/widgets/GridViewProduct.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final SearchViewModel _searchViewModel =
      SearchViewModel(SearchService(SearchRepository()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (value) => _searchViewModel.searchProduct(value),
          textInputAction: TextInputAction.search,
          controller: _searchViewModel.controllerSearch,
          onChanged: (value) {},
          cursorColor: Colors.black,
          style: const TextStyle(
            color: Colors.black,
          ),
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
            child: Obx(() => _searchViewModel.searchProducts.isEmpty
                ? Center(
                    child: _searchViewModel.search.value.contains('1')
                        ? const CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : Text(_searchViewModel.search.value))
                : GridViewProducts(
                    listProduct: _searchViewModel.searchProducts)))
      ],
    );
  }
}
