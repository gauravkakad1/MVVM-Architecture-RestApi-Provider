import 'package:mvvm_architecture_restapi_provider/data/network/base_api_services.dart';
import 'package:mvvm_architecture_restapi_provider/data/network/network_api_services.dart';
import 'package:mvvm_architecture_restapi_provider/model/MovieListModel.dart';
import 'package:mvvm_architecture_restapi_provider/utils/api_urls.dart';

class HomeRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future <MovieListModel> fetchApiData() async{
      try{
        dynamic data = await _apiServices.getGetApiResponse(ApiUrls.moviesListEndPoint.toString());
        return data = MovieListModel.fromJson(data);
      }
      catch (e){
        rethrow ;
      }
  }

}
