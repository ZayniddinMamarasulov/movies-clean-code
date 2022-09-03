import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_sample2/features/home/domain/usecases/popular_movies_use_case.dart';
import 'package:provider_sample2/features/home/domain/usecases/popular_movies_use_case_impl.dart';

import '../../data/models/movies.dart';

part 'popular_event.dart';

part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc(this.useCase) : super(PopularInitial()) {
    on<PopularEvent>(_mapPopularEventToState);
  }

  final PopularMoviesUseCase useCase;

  _mapPopularEventToState(
      PopularEvent event, Emitter<PopularState> emit) async {
    emit(PopularLoading());
    try {
      final movies = await useCase.getPopular();
      emit(PopularSuccess(movies));
    } catch (e) {
      emit(PopularError(e.toString()));
    }
  }
}
