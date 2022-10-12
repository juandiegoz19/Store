import 'package:either_dart/either.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/search/interface/i_search.dart';
import 'package:store/infrestructure/data/remote/error/network_error.dart';
import 'package:store/infrestructure/data/remote/network/base_api_service.dart';
import 'package:store/infrestructure/data/remote/network/network_api_service.dart';
import 'package:store/infrestructure/shared/Api.dart';

class SearchRepository extends ISearchRepository {
  @override
  Future<List<Products>> searchListProducts(String search) async {
    List<Products> products;
    String url = '${Apis.sync}products';

    BaseApiService apiService = NetworkApiService();

    Either<NetworkException, dynamic> response =
        await apiService.getResponse(url);

    products = productsFromJson(response.right);

    products = products.where((element) => element.title.toLowerCase().contains(search.toLowerCase())).toList();
    return products;
  }
}
