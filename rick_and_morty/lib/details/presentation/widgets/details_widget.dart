import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_getCharacterInfoFromArgs(context)),
    );
  }

  String _getCharacterInfoFromArgs(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final id = (arguments as Map<String, String?>)['id'] ?? 'Error';
    final name = arguments['name'] ?? 'Error';

    return '$id - $name';
  }
}
