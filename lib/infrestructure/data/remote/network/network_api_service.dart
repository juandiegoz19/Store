import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:store/infrestructure/data/remote/error/network_error.dart';
import 'base_api_service.dart';
import 'package:http/http.dart' as http;


class NetworkApiService extends BaseApiService {
  @override
  Future<Either<NetworkException, dynamic>> getResponse(String url) async {
    final response = await http.get(Uri.parse(url));
    return returnResponse(response, 3);
  }

  @override
  Future<Either<NetworkException, dynamic>> postResponse(
      String url, Object jsonBody,
      {Map<String, String> headers = const {}}) async {
    var response =
        await http.post(Uri.parse(url), body: jsonBody, headers: headers);

    return (returnResponse(response, 1));
  }

  @override
  Future<Either<NetworkException, dynamic>> getFile(String url) async {
    var uri = Uri.parse(url);
    final response = await http.get(uri);

    return returnResponse(response, 2);
  }

  @override
  Future getResponseJson(String url) async {
    final response = await http.get(Uri.parse(url));
    return returnResponse(response, 1);
  }
}

Either<NetworkException, dynamic> returnResponse(
    http.Response response,int typeResponse) {
  switch (response.statusCode) {
    case 200:
    case 201:
      switch (typeResponse) {
        case 1:
          Object responseJson = jsonDecode(response.body);
          return Right(responseJson);
        case 2:
        return Right(response.bodyBytes);
        case 3:
        return Right(response.body);
        default :
        return Right('');
      }
    case 400:
      dynamic responseJson = jsonDecode(response.body);
      return Left(BadRequestException(responseJson['message']));
    case 401:
    case 403:
      dynamic responseJson = jsonDecode(response.body);
      return Left(BadRequestException(responseJson['message']));
    case 404:
      dynamic responseJson = jsonDecode(response.body);
      return Left(BadRequestException(responseJson['message']));
    case 500:
    default:
      return Left(FetchDataException(
          'Error occured while communication with server' +
              ' with status code : ${response.statusCode}, message: ${response.body}'));
  }
}
