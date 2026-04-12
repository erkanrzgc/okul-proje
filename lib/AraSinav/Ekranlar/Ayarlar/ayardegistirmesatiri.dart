import 'package:flutter/material.dart';

class AyarDegistirmeSatiri extends StatelessWidget {
  final IconData Ikon;
  final String Baslik;
  final bool AcikMi;

  const AyarDegistirmeSatiri({
    super.key,
    required this.Ikon,
    required this.Baslik,
    required this.AcikMi,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Ikon, color: const Color(0xFF2E3B4E)),
      title: Text(Baslik, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Switch(
        value: AcikMi,
        onChanged: (Deger) {}, // Görüntü amaçlı
        activeThumbColor: const Color(0xFF5C6BC0),
      ),
    );
  }
}
