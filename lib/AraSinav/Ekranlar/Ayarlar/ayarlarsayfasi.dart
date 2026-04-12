import 'package:flutter/material.dart';
import 'ayarbasligi.dart';
import 'ayarsatiri.dart';
import 'kullaniciozetikarti.dart';
import 'ayardegistirmesatiri.dart';

class AyarlarSayfasi extends StatelessWidget {
  const AyarlarSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ayarlar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const KullaniciOzetiKarti(),

          const AyarBasligi(Baslik: "Hesap Ayarları"),
          const AyarSatiri(
            Ikon: Icons.person_outline,
            Baslik: "Profil Bilgileri",
            AltBaslik: "Ad, soyad ve akademik ünvan",
          ),
          const AyarSatiri(
            Ikon: Icons.lock_outline,
            Baslik: "Güvenlik",
            AltBaslik: "Şifre değiştirme ve 2FA",
          ),

          const Divider(), // Ayırıcı çizgi

          const AyarBasligi(Baslik: "Bildirimler"),
          AyarDegistirmeSatiri(
            Ikon: Icons.notifications_none,
            Baslik: "Anlık Bildirimler",
            AcikMi: true,
          ),
          AyarDegistirmeSatiri(
            Ikon: Icons.email_outlined,
            Baslik: "E-Posta Bülteni",
            AcikMi: false,
          ),

          const Divider(),

          const AyarBasligi(Baslik: "Uygulama"),
          const AyarSatiri(
            Ikon: Icons.dark_mode_outlined,
            Baslik: "Tema",
            AltBaslik: "Açık / Koyu mod tercihleri",
          ),
          const AyarSatiri(
            Ikon: Icons.language,
            Baslik: "Dil",
            AltBaslik: "Türkçe (TR)",
          ),
        ],
      ),
    );
  }
}
