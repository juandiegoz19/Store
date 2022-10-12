
import 'package:store/domain/home/model/products.dart';

abstract class ISearchRepository{
  Future<List<Products>> searchListProducts(String search);
}