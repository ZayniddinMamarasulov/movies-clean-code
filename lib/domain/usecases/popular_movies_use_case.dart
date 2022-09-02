import 'package:provider_sample2/data/models/movies.dart';

abstract class PopularMoviesUseCase {
  Future<List<Movie>> getPopular();
}
