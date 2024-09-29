import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:payung/feature/home/explore/home_explore.dart';
import 'package:payung/feature/home/home_page.dart';
import 'package:payung/feature/home/home_repository.dart';
import 'package:payung/feature/profile/profile_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(HomeExploreAdapter());

  final Box<HomeExplore> homeExploreBox =
      await Hive.openBox<HomeExplore>('homeExploreBox');
  final HomeRepository homeRepository =
      HomeRepository(homeExploreBox: homeExploreBox);

  await homeRepository.clearHomeExplore();
  final List<HomeExplore> explores = [
    HomeExplore(
      name: "Voucher Digital Indomaret",
      price: 25000,
      discountPercentage: 0,
      image: "assets/icon/apple.svg",
    ),
    HomeExplore(
      name: "Voucher Digital H&M",
      price: 100000,
      discountPercentage: 3,
      image: "assets/icon/avocado.svg",
    ),
    HomeExplore(
      name: "Voucher Digital H&M",
      price: 100000,
      discountPercentage: 3,
      image: "assets/icon/banana.svg",
    ),
    HomeExplore(
      name: "Voucher Digital Excelso",
      price: 50000,
      discountPercentage: 4,
      image: "assets/icon/cherry.svg",
    ),
    HomeExplore(
      name: "Voucher Digital Bakmi GM",
      price: 100000,
      discountPercentage: 5,
      image: "assets/icon/coffee.svg",
    ),
    HomeExplore(
      name: "Voucher Digital Haagen Dazs",
      price: 100000,
      discountPercentage: 25,
      image: "assets/icon/dumbbell.svg",
    ),
  ];

  for (var explore in explores) {
    await homeRepository.addHomeExplore(explore);
  }

  runApp(RepositoryProvider(
    create: (context) => homeRepository,
    child: const Payung(),
  ));
}

class Payung extends StatelessWidget {
  const Payung({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payung',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffF8C20A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffF8C20A),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: WidgetStateProperty.all(Colors.white)
          )
        )
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
