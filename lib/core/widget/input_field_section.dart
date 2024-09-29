import 'package:flutter/material.dart';

class InputFieldSection extends StatelessWidget {
  final Widget? child;
  final String text;
  final bool isRequired;
  const InputFieldSection({
    super.key,
    this.child,
    required this.text,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          children: [
            Visibility(
              visible: isRequired,
              child: Row(
                children: [
                  Text(
                    "*",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                ],
              ),
            ),
            Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        child ?? const SizedBox.shrink(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
