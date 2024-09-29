import 'package:flutter/material.dart';
import 'package:payung/core/extension.dart';
import 'package:payung/feature/home/explore/home_explore.dart';

import '../../../core/widget/svg_asset.dart';

class HomeExploreCard extends StatelessWidget {
  final HomeExplore item;
  const HomeExploreCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final double discountPrice =
        item.price * ((100 - item.discountPercentage) / 100);
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SvgAsset(
              icon: item.image,
              size: 70,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item.name} Rp. ${item.price.format()}",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  item.discountPercentage > 0
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Rp. ${item.price.format()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 10,
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.black,
                                        decorationThickness: 1,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "Rp. ${discountPrice.format()}",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Text(
                              "${item.discountPercentage}% OFF",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10,
                                    color: Colors.red,
                                  ),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        )
                      : Text(
                          "Rp. ${item.price.format()}",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.start,
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
