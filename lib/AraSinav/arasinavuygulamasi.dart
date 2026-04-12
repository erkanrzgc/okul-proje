import 'package:flutter/material.dart';
import 'Ekranlar/anaframe.dart';
import 'Ekranlar/Ayarlar/ayarlarsayfasi.dart';
import 'Ekranlar/kurslarsayfasi.dart';
import 'Ekranlar/takvimsayfasi.dart';
import 'Ekranlar/profilsayfasi.dart';

class AraSinavUygulamasi extends StatelessWidget {
  const AraSinavUygulamasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ara Sinav Projesi',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2E3B4E),
          primary: const Color(0xFF2E3B4E),
        ),
      ),
      // --- ROUTE TANIMLAMALARI ---
      initialRoute: '/',
      routes: {
        '/': (context) => const AnaFrame(),
        '/ayarlar': (context) => const AyarlarSayfasi(),
        '/kurslar': (context) => const KurslarSayfasi(),
        '/takvim': (context) => const TakvimSayfasi(),
        '/profil': (context) => const ProfilSayfasi(),
      },
    );
  }
}