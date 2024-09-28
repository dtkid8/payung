import 'package:flutter/material.dart';
import 'package:payung/feature/home/home_menu_card.dart';
import 'package:payung/feature/home/model/home_menu.dart';

import '../../widget/text_icon_button.dart';
import '../../widget/title_section.dart';

class HomeCategorySection extends StatelessWidget {
  final List<HomeMenu> category;
  const HomeCategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSection(
          text: "Kategori Pilihan",
          children: [
            TextIconButton(
              text: "Wishlist",
              icon: "assets/icon/lemon.svg",
            ),
          ],
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
          ),
          itemCount: category.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HomeMenuCard(
              icon: category[index].icon,
              name: category[index].name,
              isNew: category[index].isNew,
            );
          },
        ),
      ],
    );
  }
}
