import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:teachedison/models/movie_detail_model.dart';

class MovieDetailController extends GetxController {
  List<MovieDetailModel> listOfMovies = <MovieDetailModel>[].obs;
  List<String> movies = [
    'luca',
    'soul',
    'jungle cruise',
    'black widow',
    'mosley',
    'away',
    'missing link',
    'Avatar',
    // 'Seven Pounds',
    // 'dune',
    // 'luck',
    // 'Space Jam',
    // 'Minions',
    // 'infinite',
    // 'vivo',
    // 'f9',
    // 'pink',
    // 'A Good Year',
    // 'the founder',
    // 'chernobyl',
    // 'joe bell',
    // 'interstellar',
    // 'jolt',
    // 'ice age',
    // 'iron man',
    // 'kick',
    // 'away',
    // 'mosley',
    // 'terra willy',
    // 'spycies',
    // 'swift',
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

  getByImdbID(String imdbId) async {
    for (int i = 0; i < movies.length; i++) {
      var response =
          await Dio().get('http://www.omdbapi.com/?apikey=72f88193&i=$imdbId');
      try {
        if (response.statusCode == 200 || response.statusCode == 201)
          return (MovieDetailModel.fromJson(response.data));
      } catch (e) {
        print('Getting error $e');
      }
    }
  }
}
