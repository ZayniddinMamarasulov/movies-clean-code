import 'package:provider_sample2/data/models/movies.dart';
import 'package:provider_sample2/domain/repositories/movies_repository.dart';
import 'package:provider_sample2/domain/usecases/popular_movies_use_case.dart';

class PopularMoviesUseCaseImpl extends PopularMoviesUseCase {
  final MoviesRepository moviesRepository;

  PopularMoviesUseCaseImpl(this.moviesRepository);

  @override
  Future<List<Movie>> getPopular() {
    return moviesRepository.getPopular();
  }
}
