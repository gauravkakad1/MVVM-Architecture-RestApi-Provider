
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mvvm_architecture_restapi_provider/data/app_exceptions.dart';
import 'package:mvvm_architecture_restapi_provider/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices{
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try{
      final response  = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
    on SocketException{
      throw FetchDataException();
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{
      final response = await http.post( Uri.parse(url),
        body: data
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
    on SocketException{
      throw FetchDataException();
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException();
      case 404:
        throw UnauthorisedException();
      case 500:
      default :
        throw FetchDataException("Error accured while communicating with server with Source code : ${response.statusCode}");
    }
  }


}