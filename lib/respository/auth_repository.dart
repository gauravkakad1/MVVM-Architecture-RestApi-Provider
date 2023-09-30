import 'package:mvvm_architecture_restapi_provider/data/network/base_api_services.dart';
import 'package:mvvm_architecture_restapi_provider/data/network/network_api_services.dart';
import 'package:mvvm_architecture_restapi_provider/utils/api_urls.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic responseData =
          await _baseApiServices.getPostApiResponse(ApiUrls.signupUrl, data);
      return responseData;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic responseData =
          await _baseApiServices.getPostApiResponse(ApiUrls.signupUrl, data);
      return responseData;
    } catch (e) {
      rethrow;
    }
  }
}
