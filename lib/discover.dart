import 'package:flutter/material.dart';
import 'package:myapp/Menuler/appdrawer.dart';
import 'ayarlar.dart';
import 'urunler.dart';
import 'giris.dart';

// Navigasyonu kontrol eden ana yapı
class Discover extends StatefulWidget {
  const Discover({super.key});
  @override
  State<Discover> createState() => DiscoverState();
}

class DiscoverState extends State<Discover> {
  int selectedIndex = 0;
  // Sayfa Listesi
  static final List<Widget> sayfalar = [
    const Center(child: Text('Ana Sayfa', style: TextStyle(fontSize: 24))),
    const Urunler(),
//    const Center(child: Text('Favoriler', style: TextStyle(fontSize: 24))),
    const Ayarlar(baslik: 'Ayarlar sayfası Bottom Navigatordan çağrılıyor'),
    Giris(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Discover")),
      drawer: AppDrawer(),
      body: IndexedStack(
        // Sayfa durumunu korumak için IndexedStack kullanıyoruz
        index: selectedIndex,
        children: sayfalar,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: const Color.fromRGBO(158, 158, 158, 1),
        onTap: _onItemTapped, // Tıklama olayını yönetiyoruz
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Urunler'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Favoriler',),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ayarlar'),
        ],
      ),
    );
  }
}
