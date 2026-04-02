import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    late Color statusColor;

    if (status == 'dead') {
      statusColor = Colors.red;
    } else if (status == 'alive') {
      statusColor = Colors.green;
    } else {
      statusColor = Colors.grey;
    }

    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
    );
  }
}
