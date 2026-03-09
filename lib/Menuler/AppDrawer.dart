import 'package:flutter/material.dart';
import '../login.dart';
import '../ayarlar.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Menü', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Ana Sayfa'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Ayarlar'),
            onTap: () {
              Navigator.pop(context); // Drawer kapat
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Ayarlar(baslik: "Ayarlar"),
                ),
              );

            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Giriş Yap'),
            onTap: () {
              Navigator.pop(context); // Drawer kapat
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },//Provider.of<LoginPage>(context, listen: false).signOut(),
              leading: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  //Provider.of<GirisServis>(context, listen: false).signOut();
                  },
              ),
          ),
          /*
          ListTile(
            title: const Text('Görev Ekle'),
            onTap: () => Navigator.pushReplacementNamed(context, '/addTask'),
          ),
          ListTile(
            title: const Text('Görev Listesi'),
            onTap: () => Navigator.pushReplacementNamed(context, '/taskList'),
          ),
          ListTile(
            title: const Text('Öğrenci Listesi'),
            onTap: () => Navigator.pushReplacementNamed(context, '/ogrenciListesi'),
          ),
          ListTile(
            title: const Text('Shared Preferences'),
            onTap: () => Navigator.pushReplacementNamed(context, '/shared'),
          ),
          ListTile(
            title: const Text('Çıkış yap'),
            onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
          ListTile(
            title: const Text('Çıkış yap'),
            onTap: () => Navigator.pushReplacementNamed(context, '/notlar'),
          ),*/
        ],
      ),
    );
  }
}