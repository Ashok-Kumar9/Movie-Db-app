import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teachedison/models/movie_detail_model.dart';

class MovieDetailController extends GetxController {
  getMovieDetails() async {
    var response =
        await Dio().get('http://www.omdbapi.com/?apikey=72f88193&i=tt1285016');
    try {
      if (response.statusCode == 200 || response.statusCode == 201)
        return MovieDetailModel.fromJson(response.data);
      else
        print(
            'Did not receive the data because of the status code ${response.statusCode}');
    } catch (e) {
      print('Getting error $e');
    }
  }
}
