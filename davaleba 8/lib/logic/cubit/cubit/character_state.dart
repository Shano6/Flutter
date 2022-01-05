part of 'character_cubit.dart';

@immutable
abstract class CharacterState extends Equatable {}

class CharacterInitial extends CharacterState {
  @override
  List<Object?> get props => [];
}

class CharacterLoaded extends CharacterState {
  final List<Character> characterList;

  CharacterLoaded(this.characterList);

  @override
  List<Object?> get props => [characterList];
}

class CharacterLoadingError extends CharacterState {
  final String errorMessage;

  CharacterLoadingError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
