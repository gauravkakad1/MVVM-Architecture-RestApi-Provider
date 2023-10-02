
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_restapi_provider/data/response/api_response.dart';
import 'package:mvvm_architecture_restapi_provider/model/MovieListModel.dart';
import 'package:mvvm_architecture_restapi_provider/respository/home_repository.dart';

import '../utils/utils.dart';

class HomeViewViewModel with ChangeNotifier{

  final _myRepo = HomeRepository();
  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> apiResponse){
    movieList = apiResponse;
    notifyListeners();
  }

  Future <void> fetchMovieListApi() async{
    setMovieList(ApiResponse.loading());

    _myRepo.fetchApiData().then((value) {
      setMovieList(ApiResponse.completed(value));

    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error(error.toString()));

    });
  }


}