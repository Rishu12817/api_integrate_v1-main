import 'package:api_integrate_v1/views/getX_tut.dart';
import 'package:api_integrate_v1/atestdemon/ghar_kaScreen.dart';
import 'package:flutter/material.dart';
import 'views/bottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // home:  GeTXTut(),
      home:  GharKaScreen(),
    );
  }
}