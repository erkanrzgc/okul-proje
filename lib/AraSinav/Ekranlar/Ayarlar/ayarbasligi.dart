import 'package:flutter/material.dart';

class AyarBasligi extends StatelessWidget {
  final String Baslik;
  const AyarBasligi({super.key, required this.Baslik});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        Baslik.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
