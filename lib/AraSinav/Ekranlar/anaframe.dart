import 'package:flutter/material.dart';
import 'kurslarsayfasi.dart';
import 'takvimsayfasi.dart';
import 'profilsayfasi.dart';
import '../MenuveBarlar/yanmenu.dart';
import '../MenuveBarlar/appbar.dart';
import '../MenuveBarlar/altmenu.dart';
import '../KartlarveModeller/indexedstack.dart';

// --- ANA NAVİGASYON KONTROLCÜSÜ ---

class AnaFrame extends StatefulWidget {
  const AnaFrame({super.key});

  @override
  State<AnaFrame> createState() => AnaFrameDurum();
}

class AnaFrameDurum extends State<AnaFrame> {
  // Alt çizgi kaldırıldı ve ilk harfler büyük yapıldı
  int Seciliindis=0;

  final List<Widget> Sayfalar = [
    const KurslarSayfasi(),
    const TakvimSayfasi(),
    const ProfilSayfasi(),
  ];
  final List<String> Basliklar = [ 'Kurslarım', 'Takvim', 'Profilim', ];
  void SayfaDegistir(int Indis) {
    setState(() {
      Seciliindis = Indis;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: OzelAppBar(
        Baslik: Basliklar[Seciliindis],
        //AnaSayfaMi: Seciliindis == 0,
      ),

      drawer: const YanMenu(),

      // 2. Sayfa İçeriği
      body: Yigin(
        Seciliindis: Seciliindis,
        Sayfalar: Sayfalar,
      ),
      /*
      // 2. Sayfa İçeriği
      body: IndexedStack(
        index: SeciliIndeks,
        children: Sayfalar,
      ),
      */

      // 3. Özel Alt Menümüz
      bottomNavigationBar: AltMenu(
        Seciliindis: Seciliindis,
        TiklamaFonksiyonu: SayfaDegistir,
      ),
    );
  }
}
