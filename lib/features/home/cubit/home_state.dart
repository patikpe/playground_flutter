part of 'home_cubit.dart';

enum HomeStatus {
  homeInitial,
  homeLoaded,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final HomeModel? homeData;

  const HomeState({
    this.status = HomeStatus.homeInitial,
    this.homeData,
  });

  HomeState copyWith({
    HomeStatus? status,
    HomeModel? homeData,
  }) {
    return HomeState(
      status: status ?? this.status,
      homeData: homeData ?? this.homeData,
    );
  }

  @override
  List<Object?> get props => [
        identityHashCode(this),
        status,
        homeData,
      ];
}
