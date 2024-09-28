import 'package:flutter/material.dart';
import 'package:payung/feature/home/home_page.dart';

void main() {
  runApp(const Payung());
}

class Payung extends StatelessWidget {
  const Payung({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payung',
      theme: ThemeData(
        primaryColor: const Color(0xffF8C20A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffF8C20A),
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffF8C20A),
        ),
      ),
      home: const HomePage(title: 'Payung'),
    );
  }
}
