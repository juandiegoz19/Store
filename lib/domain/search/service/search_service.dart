
import 'package:store/domain/home/model/products.dart';
import 'package:store/domain/search/interface/i_search.dart';

class SearchService {
  final ISearchRepository iSearchRepository;

  SearchService(this.iSearchRepository);  

  Future<List<Products>> searchListProducts(String search) async{
    return await iSearchRepository.searchListProducts(search);
  }


}