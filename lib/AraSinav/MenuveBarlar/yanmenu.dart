import 'package:flutter/material.dart';

// --- EKRANLAR VE YAN MENÜ ---
class YanMenu extends StatelessWidget {
  const YanMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF2E3B4E)),
            child: Text(
              'Ara Sinav Projesi',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ayarlar'),
            onTap: () {
              Navigator.pop(context); // Menüyü kapat
              Navigator.pushNamed(context, '/ayarlar'); // Route kullanarak git
            },
          ),
        ],
      ),
    );
  }
}