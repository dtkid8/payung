import 'package:flutter/material.dart';
import 'package:payung/feature/home/home_explore_card.dart';
import 'package:payung/feature/home/model/home_explore.dart';
import '../../widget/text_icon_button.dart';
import '../../widget/title_section.dart';

class HomeExploreSection extends StatelessWidget {
  final List<HomeExplore> explore;
  const HomeExploreSection({super.key, required this.explore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSection(
          text: "Explore Wellness",
          children: [
            TextIconButton(
              text: "Terpopuler",
              icon: "assets/icon/dumbbell.svg",
            )
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: explore.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HomeExploreCard(
              item: explore[index],
            );
          },
        ),
      ],
    );
  }
}
