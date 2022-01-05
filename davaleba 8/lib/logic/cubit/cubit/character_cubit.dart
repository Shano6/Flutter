import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rest_api_ex/data/models/character.dart';
import 'package:rest_api_ex/data/repository/character_repository.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : super(CharacterInitial());

  final characterRepository = CharacterRepository();

  Future<void> fetchCharacters() async {
    emit(CharacterInitial());
    try {
      var characterList = await characterRepository.fetchCharacters();
      emit(CharacterLoaded(characterList!));
    } catch (e) {
      emit(
        CharacterLoadingError(e.toString()),
      );
    }
  }
}
