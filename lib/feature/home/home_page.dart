import 'package:flutter/material.dart';
import 'package:payung/feature/home/home_explore_section.dart';
import 'package:payung/feature/home/model/home_bottom_navigation_menu.dart';
import 'package:payung/feature/home/model/home_explore.dart';
import 'package:payung/feature/home/model/home_menu.dart';
import 'package:payung/feature/home/home_category_section.dart';
import 'package:payung/feature/home/home_product_section.dart';
import 'package:payung/widget/icon_profile.dart';
import 'package:payung/feature/home/home_bottom_navigation_bar.dart';
import '../../etc/app_icon.dart';
import '../../widget/svg_asset.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final Color colorWhite = Colors.white;
  final List<HomeMenu> _productMenu = [
    HomeMenu(
      name: "Urun",
      icon: "assets/icon/apple.svg",
      isNew: true,
    ),
    HomeMenu(
      name: "Pembiayaan Porsi Haji",
      icon: "assets/icon/avocado.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Financial Check Up",
      icon: "assets/icon/banana.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Asuransi Mobil",
      icon: "assets/icon/cherry.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Asuransi Properi",
      icon: "assets/icon/coffee.svg",
      isNew: false,
    ),
  ];

  final List<HomeMenu> _categoryMenu = [
    HomeMenu(
      name: "Hobi",
      icon: "assets/icon/dumbbell.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Merchandise",
      icon: "assets/icon/fish.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Gaya Hidup Sehat",
      icon: "assets/icon/kiwi.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Konseling & Rohani",
      icon: "assets/icon/lemon.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Self Development",
      icon: "assets/icon/poached.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Perencanaan Keungaan",
      icon: "assets/icon/running.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Konsultasi Medis",
      icon: "assets/icon/steak.svg",
      isNew: false,
    ),
    HomeMenu(
      name: "Lihat Semua",
      icon: "assets/icon/milk.svg",
      isNew: false,
    ),
  ];

  final List<HomeExplore> _explore = [
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

  final List<HomeBottomNavigationMenu> _homeBottomNavigationMenu = [
    HomeBottomNavigationMenu(
      icon: "assets/icon/apple.svg",
      label: "Beranda",
      count: 0,
    ),
    HomeBottomNavigationMenu(
      icon: "assets/icon/avocado.svg",
      label: "Cari",
      count: 0,
    ),
    HomeBottomNavigationMenu(
      icon: "assets/icon/banana.svg",
      label: "Keranjang",
      count: 0,
      isShowNotification: true,
    ),
    HomeBottomNavigationMenu(
      icon: "assets/icon/cherry.svg",
      label: "Daftar Transaksi",
      count: 0,
      isShowNotification: true,
    ),
    HomeBottomNavigationMenu(
      icon: "assets/icon/coffee.svg",
      label: "Voucher Saya",
      count: 0,
    ),
    HomeBottomNavigationMenu(
      icon: "assets/icon/dumbbell.svg",
      label: "Alamat Pengiriman",
      count: 0,
    ),
    HomeBottomNavigationMenu(
      icon: "assets/icon/fish.svg",
      label: "Daftar Teman",
      count: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Stack(
          children: [
            _buildAppBar(),
            _buildContent(),
            HomeBottomNavigationBar(
              selectedIndex: _selectedIndex,
              onTapMenu: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              items: _homeBottomNavigationMenu,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 100,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 8,
          right: 8,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Malam",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: colorWhite),
                    ),
                    Text(
                      "Muhammad",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: colorWhite,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgAsset(
                      icon: AppIcon.notification,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      onTap: () {
                        print("masuk");
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const IconProfile(
                      name: "E",
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 110,
      ),
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20.0),
              right: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeProductSection(
                  product: _productMenu,
                ),
                HomeCategorySection(
                  category: _categoryMenu,
                ),
                HomeExploreSection(
                  explore: _explore,
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
