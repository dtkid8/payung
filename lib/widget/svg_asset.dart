import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  final String icon;
  final Color color;
  final double size;
  final Function()? onTap;
  final ColorFilter? colorFilter;
  const SvgAsset({
    super.key,
    required this.icon,
    this.color = Colors.white,
    this.size = 24,
    this.onTap,
    this.colorFilter,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: size,
        height: size,
        child: SvgPicture.asset(
          icon,
          width: size,
          colorFilter: colorFilter,
        ),
      ),
    );
  }
}
