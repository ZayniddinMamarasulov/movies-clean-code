
import 'package:provider_sample2/features/home/domain/usecases/popular_movies_use_case.dart';

import '../../data/models/movies.dart';
import '../repositories/movies_repository.dart';

class PopularMoviesUseCaseImpl implements PopularMoviesUseCase {
  final MoviesRepository moviesRepository;

  PopularMoviesUseCaseImpl(this.moviesRepository);

  @override
  Future<List<Movie>> getPopular() {
    return moviesRepository.getPopular();
  }
}
