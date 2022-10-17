import 'package:store/domain/home/interface/i_home.dart';
import 'package:store/domain/home/model/products.dart';

class HomeService {
  final IHomeRepository iHomeRepository;

  HomeService(this.iHomeRepository);

  Future<List<String>> listCategory() async {
    return await iHomeRepository.listCategory();
  }

  Future<List<Products>> listProducts() async {
    return await iHomeRepository.listProducts();
  }

  Future<List<Products>> listCategoryProducts(category) async {
    return await iHomeRepository.listCategoryProducts(category);
  }
}
