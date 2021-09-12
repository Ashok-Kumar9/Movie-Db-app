import 'package:MovieFlex/models/search_movie_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SearchMovieController extends GetxController {
  List<SearchMovieModel> searchedMovieList = <SearchMovieModel>[].obs;

  detailsFromQuery({required String query, int page = 1}) async {
    var response =
        await Dio().get('http://www.omdbapi.com/?apikey=72f88193&page=$page&s=$query');
    try {
      if (response.statusCode == 200 || response.statusCode == 201)
        return (SearchMovieModel.fromJson(response.data));
    } catch (e) {
      print('Getting error $e');
    }
  }
}
