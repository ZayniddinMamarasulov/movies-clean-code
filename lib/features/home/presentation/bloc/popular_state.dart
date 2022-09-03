part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  final List<Movie>? movies;
  final String? error;

  const PopularState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class PopularInitial extends PopularState {
  @override
  List<Object> get props => [];
}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final List<Movie>? movies;
  final String imgUrl = "https://image.tmdb.org/t/p/w500/";

  const PopularSuccess(this.movies) : super(movies: movies);

  @override
  List<Object?> get props => [movies];
}

class PopularError extends PopularState {
  final String error;

  const PopularError(this.error) : super(error: error);

  @override
  List<Object?> get props => [error];
}
