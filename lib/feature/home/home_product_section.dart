import 'package:flutter/material.dart';
import 'package:payung/feature/home/model/home_menu.dart';
import '../../widget/title_section.dart';
import 'home_menu_card.dart';

class HomeProductSection extends StatelessWidget {
  final List<HomeMenu> product;
  const HomeProductSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleSection(
          text: "Produk Keuangan",
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
          ),
          itemCount: product.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return HomeMenuCard(
              icon: product[index].icon,
              name: product[index].name,
              isNew: product[index].isNew,
            );
          },
        ),
      ],
    );
  }
}
