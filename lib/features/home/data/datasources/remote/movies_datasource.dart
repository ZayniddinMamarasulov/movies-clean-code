import '../../models/movies.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getPopular();
}
