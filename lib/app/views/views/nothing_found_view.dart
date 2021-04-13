import 'package:flutter/material.dart';

class NothingFound extends StatelessWidget {
  final String object;
  final bool positive;

  const NothingFound(
    this.object, {
    this.positive = false,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container()),
        Icon(
          positive ? Icons.thumb_up_alt_outlined : Icons.warning_amber_outlined,
          size: 60,
          color: positive ? Colors.indigoAccent : Colors.red,
        ),
        SizedBox(height: 20),
        Text(
          'No $object Found.',
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
