import 'package:flutter/material.dart';
import '../KartlarveModeller/kurskarti.dart';
import '../KartlarveModeller/kursmodeli.dart';

class KurslarSayfasi extends StatelessWidget {
  const KurslarSayfasi({super.key});

  // --- 5 KURSLUK DİNAMİK LİSTE ---
  final List<KursModeli> Kurslistesi = const [
    KursModeli(
      KursAdi: "Mobil Uygulama Geliştirme",
      EgitmenAdi: "Dr. Hakan GENÇOĞLU",
      IlerlemeOrani: 0.65,
      KursIkonu: Icons.flutter_dash,
    ),
    KursModeli(
      KursAdi: "Nesne Yönelimli Programlama",
      EgitmenAdi: "Dr. Volkan ÇETİN",
      IlerlemeOrani: 0.40,
      KursIkonu: Icons.code,
    ),
    KursModeli(
      KursAdi: "Veri Yapıları ve Algoritmalar",
      EgitmenAdi: "Dr. Cevat REŞİT",
      IlerlemeOrani: 0.85,
      KursIkonu: Icons.account_tree,
    ),
    KursModeli(
      KursAdi: "Veritabanı Yönetim Sistemleri",
      EgitmenAdi: "Dr. Hakan GENÇOĞLU",
      IlerlemeOrani: 0.20,
      KursIkonu: Icons.storage,
    ),
    KursModeli(
      KursAdi: "Yapay Zekaya Giriş",
      EgitmenAdi: "Dr. Sahra TİLKİ",
      IlerlemeOrani: 0.10,
      KursIkonu: Icons.psychology,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      // --- GRIDVIEW YAPISI ---
      child: GridView.builder(
        itemCount: Kurslistesi.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Yan yana 2 kart
          crossAxisSpacing: 25, // Yatay boşluk
          mainAxisSpacing: 25, // Dikey boşluk
          childAspectRatio: 3, // Kartların en-boy oranı
        ),
        itemBuilder: (context, Indeks) {
          final Kurs = Kurslistesi[Indeks];
          return KursKarti(Kursverisi: Kurs);
        },
      ),
    );
  }
}
