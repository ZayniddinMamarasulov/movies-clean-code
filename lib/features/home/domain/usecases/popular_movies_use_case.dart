
import '../../data/models/movies.dart';

abstract class PopularMoviesUseCase {
  Future<List<Movie>> getPopular();
}
