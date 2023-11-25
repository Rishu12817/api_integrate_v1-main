import 'package:api_integrate_v1/views/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomNavigation.dart';
class GeTXTut extends StatelessWidget {
  const GeTXTut({super.key});

@override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      // darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.red),
      home:  BottonNavigator(),
    );
  }
}