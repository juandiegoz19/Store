import 'package:either_dart/either.dart';
import 'package:store/domain/home/interface/i_home.dart';
import 'package:store/domain/home/model/category.dart';
import 'package:store/domain/home/model/products.dart';
import 'package:store/infrestructure/data/remote/error/network_error.dart';
import 'package:store/infrestructure/data/remote/network/base_api_service.dart';
import 'package:store/infrestructure/data/remote/network/network_api_service.dart';
import 'package:store/infrestructure/shared/Api.dart';

class HomeRepository extends IHomeRepository {
  @override
  Future<List<String>> listCategory() async {
    List<String> categories;
    String url = '${Apis.sync}products/categories';

    BaseApiService apiService = NetworkApiService();

    Either<NetworkException, dynamic>  response = await apiService.getResponse(url);
    
    categories = categoryFromJson(response.right);
    
    return categories;
  }

  @override
  Future<List<Products>> listProducts() async{
    List<Products> products;
    String url = '${Apis.sync}products';

    BaseApiService apiService = NetworkApiService();

    Either<NetworkException, dynamic>  response = await apiService.getResponse(url);
    
    products = productsFromJson(response.right);
    
    return products;
  }
}
