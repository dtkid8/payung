import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payung/core/base_state.dart';
import 'package:payung/feature/home/explore/home_explore_card.dart';
import 'package:payung/feature/home/explore/home_explore.dart';
import 'package:payung/feature/home/explore/home_explore_cubit.dart';
import 'package:payung/feature/home/home_repository.dart';
import '../../../core/widget/text_icon_button.dart';
import '../../../core/widget/title_section.dart';

class HomeExploreSection extends StatelessWidget {
  const HomeExploreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeExploreCubit(
        homeRepository: context.read<HomeRepository>(),
      ),
      child: const HomeExploreView(),
    );
  }
}

class HomeExploreView extends StatefulWidget {
  const HomeExploreView({
    super.key,
  });

  @override
  State<HomeExploreView> createState() => _HomeExploreViewState();
}

class _HomeExploreViewState extends State<HomeExploreView> {
  @override
  void initState() {
    context.read<HomeExploreCubit>().getHomeExplore();
    super.initState();
  }

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
        BlocBuilder<HomeExploreCubit, BaseState<List<HomeExplore>>>(
          builder: (context, state) {
            final List<HomeExplore> explores = state.data ?? [];
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: explores.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HomeExploreCard(
                  item: explores[index],
                );
              },
            );
          },
        ),
      ],
    );
  }
}
