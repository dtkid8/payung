import 'package:flutter/material.dart';

import '../../core/widget/svg_asset.dart';

class HomeMenuCard extends StatelessWidget {
  final String icon;
  final String name;
  final bool isNew;
  const HomeMenuCard({
    super.key,
    required this.icon,
    required this.name,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgAsset(
                  icon: icon,
                  size: 32,
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        Visibility(
          visible: isNew,
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Text(
                      "NEW",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Colors.white,fontSize: 8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
