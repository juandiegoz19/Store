
import 'package:store/domain/home/model/products.dart';

abstract class IHomeRepository{
  Future<List<String>> listCategory();
  Future<List<Products>> listProducts();
  Future<List<Products>> listCategoryProducts(category);
}