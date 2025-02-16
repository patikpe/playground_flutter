import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  getHomeConfig() {
    emit(state.copyWith(status: HomeStatus.homeLoaded));
  }
}
