import 'package:api_integrate_v1/views/HomeScreen.dart';
import 'package:api_integrate_v1/views/kart.dart';
import 'package:flutter/material.dart';

class BottonNavigator extends StatefulWidget {
  const BottonNavigator({super.key});

  @override
  State<BottonNavigator> createState() => _BottonNavigatorState();
}

class _BottonNavigatorState extends State<BottonNavigator> {
  int _index = 0;
  final Screen = [
    HomeScreen(),
    KartScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (val) {
          setState(() {
            _index = val;
          });
        },currentIndex: _index,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Kart"),
      ],
    ),
    );
  }
}
