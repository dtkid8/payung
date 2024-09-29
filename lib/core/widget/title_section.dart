import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final List<Widget> children;
  final String text;
  const TitleSection({
    super.key,
    this.children = const [],
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: children.isEmpty
          ? MainAxisAlignment.start
          : MainAxisAlignment.spaceBetween,
      children: <Widget>[
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ] +
          children,
    );
  }
}
