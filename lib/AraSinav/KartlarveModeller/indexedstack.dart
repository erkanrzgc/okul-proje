import 'package:flutter/material.dart';

class Yigin extends StatelessWidget {
  // Tıklanan indeksi ana sayfaya bildirmek için Function kullanıyoruz
  final List<Widget> Sayfalar;
  final int Seciliindis;

  const Yigin({super.key, required this.Seciliindis, required this.Sayfalar});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: Seciliindis, children: Sayfalar);
  }
}
