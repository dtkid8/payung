import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payung/core/base_state.dart';
import 'package:payung/feature/home/explore/home_explore.dart';
import 'package:payung/feature/home/home_repository.dart';

class HomeExploreCubit extends Cubit<BaseState<List<HomeExplore>>> {
  final HomeRepository homeRepository;
  HomeExploreCubit({
    required this.homeRepository,
  }) : super(const BaseState());

  Future<void> getHomeExplore() async {
    final result = await homeRepository.getHomeExplore();
    emit(state.copyWith(isLoading: true));
    result.fold((failure) {
      emit(state.copyWith(error: failure.errorMessage));
    }, (success) {
      emit(state.copyWith(data: success));
    });
  }
}
