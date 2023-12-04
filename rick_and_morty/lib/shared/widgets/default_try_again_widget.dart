import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Ops. something wrong happened',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          TextButton(onPressed: onPressed, child: const Text('Try Again'))
        ]),
      );
}
