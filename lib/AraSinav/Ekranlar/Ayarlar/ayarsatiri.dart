import 'package:flutter/material.dart';

class AyarSatiri extends StatelessWidget {
  final IconData Ikon;
  final String Baslik;
  final String AltBaslik;

  const AyarSatiri({
    super.key,
    required this.Ikon,
    required this.Baslik,
    required this.AltBaslik,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Ikon, color: const Color(0xFF2E3B4E)),
      title: Text(Baslik, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(AltBaslik, style: const TextStyle(fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: () {}, // Görüntü amaçlı boş fonksiyon
    );
  }
}
