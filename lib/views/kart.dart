import 'package:flutter/material.dart';

class KartScreen extends StatefulWidget {
  const KartScreen({super.key});

  @override
  State<KartScreen> createState() => _KartScreenState();
}

class _KartScreenState extends State<KartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kart'),
      ),
        backgroundColor: Color.fromARGB(255, 0, 52, 240),
      body: Center(
        child: Text('Kart'),
        ),
    );
  }
}