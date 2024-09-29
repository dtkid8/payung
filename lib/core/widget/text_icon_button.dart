import 'package:flutter/material.dart';
import 'package:payung/core/widget/svg_asset.dart';

class TextIconButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function()? onTap;

  const TextIconButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.grey.withOpacity(0.3), // Highlight color
        splashColor: Colors.grey.withOpacity(0.5), // Splash color
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(width: 2),
                SvgAsset(icon: icon,size: 14,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
