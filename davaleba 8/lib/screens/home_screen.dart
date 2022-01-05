import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_ex/logic/cubit/cubit/character_cubit.dart';
import 'package:rest_api_ex/logic/cubit/cubit/planet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character App'),
      ),
      body: BlocBuilder<CharacterCubit, CharacterState>(
        bloc: context.read<CharacterCubit>()..fetchCharacters(),
        builder: (context, state) {
          if (state is CharacterInitial) {
            return const CircularProgressIndicator();
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.characterList[index].name!),
                  subtitle: Text(state.characterList[index].homeworld!),
                    onTap: () => {
                      context.read<PlanetCubit>().fetchPlanet(state.characterList[index].homeworld!)
                    });
              },
              itemCount: state.characterList.length,
            );
          } else {
            return Center(
              child: Text((state as CharacterLoadingError).errorMessage),
            );
          }
        },
      ),
    );
  }
}
