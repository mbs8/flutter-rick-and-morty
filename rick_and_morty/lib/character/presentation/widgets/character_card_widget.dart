import 'package:flutter/material.dart';
import 'package:rick_and_morty/character/data/service/character_response.dart';
import 'package:rick_and_morty/character/presentation/widgets/basic_info_character_widget.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    super.key,
    required this.response,
    this.onTap,
  });

  final CharacterResponse response;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: theme.cardTheme.elevation,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(response.image),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${response.id} - ${response.name}',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        BasicInfoCharacterWidget(
                          response: response,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        if (response.type.isNotEmpty) ...{
                          Text(
                            'Type',
                            style: theme.textTheme.bodySmall
                                ?.copyWith(fontSize: 13),
                          ),
                          Expanded(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              response.type,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                        },
                        Text(
                          'Last known location',
                          style:
                              theme.textTheme.bodySmall?.copyWith(fontSize: 13),
                        ),
                        Expanded(
                          child: Text(
                            response.location.name,
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
