part of 'home_cubit.dart';

enum HomeStatus {
  homeInitial,
  homeLoaded,
}

class HomeState extends Equatable {
  final HomeStatus status;

  const HomeState({
    this.status = HomeStatus.homeInitial,
  });

  HomeState copyWith({
    HomeStatus? status,
  }) {
    return HomeState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
