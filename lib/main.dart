import 'package:flutter/material.dart';

import 'pages/portfolio_page.dart';

void main() {
runApp(const VijayPortfolioApp());
}

class VijayPortfolioApp extends StatefulWidget {
const VijayPortfolioApp({super.key});

@override
State<VijayPortfolioApp> createState() => _VijayPortfolioAppState();
}

class _VijayPortfolioAppState extends State<VijayPortfolioApp> {
ThemeMode _themeMode = ThemeMode.dark;

void _toggleTheme() {
setState(() {
_themeMode = _themeMode == ThemeMode.dark
? ThemeMode.light
    : ThemeMode.dark;
});
}

@override
Widget build(BuildContext context) {
final isDarkMode = _themeMode == ThemeMode.dark;

return MaterialApp(
debugShowCheckedModeBanner: false,
title: 'Vijay Raju Pokala | Flutter Developer',

theme: ThemeData(
useMaterial3: true,
brightness: Brightness.light,
colorSchemeSeed: Colors.blue,
scaffoldBackgroundColor: Colors.white,
cardTheme: const CardThemeData(
margin: EdgeInsets.zero,
),
),

darkTheme: ThemeData(
useMaterial3: true,
brightness: Brightness.dark,
colorSchemeSeed: Colors.blue,
scaffoldBackgroundColor: const Color(0xFF0B1020),
cardTheme: const CardThemeData(
margin: EdgeInsets.zero,
),
),

themeMode: _themeMode,

home: PortfolioPage(
isDarkMode: isDarkMode,
onToggleTheme: _toggleTheme,
),
);
}
}