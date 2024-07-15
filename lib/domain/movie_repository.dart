import 'package:flutter_application_1/data/models/movie_model.dart';
import 'package:flutter_application_1/network/client.dart';

class MovieRepository {
  static MovieRepository? instance;
  static getInstance() {
    instance ??= MovieRepository();
    return instance;
  }

  Future<List> _getMovieList() async {
    Map movies = await getDataFromServer();
    print('movies are ${movies}');
    return movies['result'] as List;
  }

  Future<List<MovieModel>> getMovieList() async {
    List<MovieModel> movies = [];
    List data = await _getMovieList();

    for (var movie in data) {
      movies.add(MovieModel.fromJson(movie));
    }
    return movies;
  }
}
