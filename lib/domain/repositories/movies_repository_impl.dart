import 'package:provider_sample2/data/datasources/remote/movies_datasource_impl.dart';
import 'package:provider_sample2/data/models/movies.dart';
import 'package:provider_sample2/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesDataSourceImpl moviesDataSourceImpl;

  MoviesRepositoryImpl(this.moviesDataSourceImpl);

  @override
  Future<List<Movie>> getPopular() {
    return moviesDataSourceImpl.getPopular();
  }
}
