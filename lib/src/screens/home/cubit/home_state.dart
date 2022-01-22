part of 'home_cubit.dart';

class HomeState extends Equatable {
  final List<Champion> champions;
  final Failure failure;

  const HomeState({
    required this.champions,
    required this.failure,
  });

  @override
  List<Object> get props => [];
  factory HomeState.initial() {
    return const HomeState(
      champions: [],
      failure: Failure(),
    );
  }

  HomeState copyWith({
    List<Champion>? champions,
    Failure? failure,
  }) {
    return HomeState(
      champions: champions ?? this.champions,
      failure: failure ?? this.failure,
    );
  }
}
