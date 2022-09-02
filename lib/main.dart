import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample2/presentation/provider/home_page_vm.dart';
import 'package:provider_sample2/presentation/screens/home_page.dart';

import 'data/datasources/remote/movies_datasource_impl.dart';
import 'domain/repositories/movies_repository_impl.dart';
import 'domain/usecases/popular_movies_use_case_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var popularMoviesUseCase =
        PopularMoviesUseCaseImpl(MoviesRepositoryImpl(MoviesDataSourceImpl()));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => HomePageViewModel(popularMoviesUseCase))
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
