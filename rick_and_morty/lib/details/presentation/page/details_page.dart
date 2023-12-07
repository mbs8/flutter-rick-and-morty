import 'package:flutter/material.dart';
import 'package:rick_and_morty/details/presentation/widgets/details_widget.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.characterId,
  });

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return DetailsWidget(
      characterId: characterId,
    );
  }
}
