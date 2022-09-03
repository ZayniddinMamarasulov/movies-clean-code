import '../../data/models/movies.dart';

abstract class MoviesRepository{
  Future<List<Movie>> getPopular();
  // getLatest();
 // getRussianMovies();
}