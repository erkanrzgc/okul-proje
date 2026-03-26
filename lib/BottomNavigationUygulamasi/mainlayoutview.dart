import 'package:flutter/material.dart';
import 'package:myapp/BottomNavigationUygulamasi/categoriesview.dart';
import 'package:myapp/BottomNavigationUygulamasi/productsview.dart';
import 'package:myapp/BottomNavigationUygulamasi/settingsview.dart';

// --- 2. ANA TAŞIYICI (MainLayoutView) ---
class MainLayoutView extends StatefulWidget {
  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int indis = 0;

  final List<Widget> sayfalar = [
    const ProductsView(),
    const CategoriesView(),
    const SettingsView(),
  ];
  final List<String> sayfaBasligi = ['Ürünler', 'Kategoriler', 'Ayarlar'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //      appBar: AppBar(title: const Text('Ana Sayfa')),
      appBar: AppBar(title: Text(sayfaBasligi[indis])),

      body: sayfalar[indis],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indis,
        onTap: (index) => setState(() => indis = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ürünler', 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Kategoriler',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ayarlar'),
        ],
      ),
    );
  }
}
