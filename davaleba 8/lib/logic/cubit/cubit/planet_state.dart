part of 'planet_cubit.dart';


@immutable
abstract class PlanetState extends Equatable {}

class PlanetInitial extends PlanetState {
  @override
  List<Object?> get props => [];
}

class PlanetLoaded extends PlanetState {
  late final Planet planet;

  PlanetLoaded(this.planet);

  @override
  List<Object?> get props => [planet];
}

class PlanetLoadingError extends PlanetState {
  final String errorMessage;

  PlanetLoadingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
