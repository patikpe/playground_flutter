import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:playground_flutter/models/app_config_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());
}
