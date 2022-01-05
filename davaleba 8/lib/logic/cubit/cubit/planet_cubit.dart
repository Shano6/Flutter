import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rest_api_ex/data/models/planet.dart';
import 'package:rest_api_ex/data/repository/planet_repository.dart';

part 'planet_state.dart';

class PlanetCubit extends Cubit<PlanetState> {
  PlanetCubit() : super(PlanetInitial());

  final planetRepository = PlanetRepository();

  Future<void> fetchPlanet(String url) async {
    emit(PlanetInitial());
    try {
      var planet = await planetRepository.fetchPlanet(url);
      emit(PlanetLoaded(planet));
    } catch (e) {
      emit(
        PlanetLoadingError(e.toString()),
      );
    }
  }
}
