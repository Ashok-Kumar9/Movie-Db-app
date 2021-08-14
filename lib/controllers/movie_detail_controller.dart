import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teachedison/models/movie_detail_model.dart';

class MovieDetailController extends GetxController {
  List<MovieDetailModel> listOfMovies = <MovieDetailModel>[].obs;
  List<String> movies = [
    'rick and morty',
    'pink',
    'the founder',
    'chernobyl',
    'interstellar',
    'jolt',
    'luca'
  ];

  getMovieDetails() async {
    for (int i = 0; i < movies.length; i++) {
      var response = await Dio()
          .get('http://www.omdbapi.com/?apikey=72f88193&t=${movies[i]}');
      try {
        if (response.statusCode == 200 || response.statusCode == 201)
          listOfMovies.add(MovieDetailModel.fromJson(response.data));
        else
          print(
              'Did not receive the data because of the status code ${response.statusCode}');
      } catch (e) {
        print('Getting error $e');
      }
    }
  }
}
