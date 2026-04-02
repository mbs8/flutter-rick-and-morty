import 'package:flutter/material.dart';
import 'package:rick_and_morty/character/data/service/character_response.dart';
import 'package:rick_and_morty/shared/widgets/circle_widget.dart';

class BasicInfoCharacterWidget extends StatelessWidget {
  const BasicInfoCharacterWidget({super.key, required this.response});

  final CharacterResponse response;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CircleWidget(status: response.status.toLowerCase()),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            _formattedBasicInfo(response),
            style: theme.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }

  String _formattedBasicInfo(response) {
    if (response.gender == 'unknown') {
      return '${response.status} - ${response.species}';
    }

    return '${response.status} - ${response.gender}'
        ' ${response.species.toLowerCase()}';
  }
}
