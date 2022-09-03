import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample2/features/counter/presentation/bloc/counter_cubit.dart';
import 'package:provider_sample2/features/counter/presentation/screens/counter_page.dart';
import 'package:provider_sample2/features/home/domain/usecases/popular_movies_use_case_impl.dart';
import 'package:provider_sample2/features/home/presentation/bloc/popular_bloc.dart';
import 'package:provider_sample2/features/home/presentation/screens/home_page.dart';
import 'features/home/data/datasources/remote/movies_datasource_impl.dart';
import 'features/home/domain/repositories/movies_repository_impl.dart';
import 'features/home/presentation/provider/home_page_vm.dart';
import 'package:bloc/bloc.dart';

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
        home: BlocProvider(
          create: (context) => PopularBloc(popularMoviesUseCase),
          child: HomePage(),
        ),
      ),
    );
  }
}
