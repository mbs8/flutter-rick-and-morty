import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/details/presentation/bloc/character_details_bloc.dart';
import 'package:rick_and_morty/details/presentation/widgets/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterDetailsBloc>()
        ..add(CharacterDetailsRequestEvent(characterId)),
      child: Scaffold(
        appBar: AppBar(),
        body: DetailsWidget(
          characterId: characterId,
        ),
      ),
    );
  }
}
