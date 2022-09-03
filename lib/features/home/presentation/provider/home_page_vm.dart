import 'package:flutter/material.dart';
import '../../data/models/movies.dart';
import '../../domain/usecases/popular_movies_use_case.dart';

class HomePageViewModel extends ChangeNotifier {
  final PopularMoviesUseCase popularMoviesUseCase;

  HomePageViewModel(this.popularMoviesUseCase);

  List<Movie> popularMovies = [];
  String imgUrl = "https://image.tmdb.org/t/p/w500/";

  Future<void> getMovies() async {
    var list = await popularMoviesUseCase.getPopular();
    popularMovies.clear();
    popularMovies.addAll(list);
    notifyListeners();
  }
}
